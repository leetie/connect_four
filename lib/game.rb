#./lib/connect_four.rb
require 'colorize'
require_relative 'player_class'

class Game
  include Enumerable
  attr_accessor :board, :choice, :current_player
  attr_reader :player_1, :player_2

  def initialize 
    @board = Array.new(6) {Array.new(7, "O".colorize(:background => :green))}
    @player_1 = Player.new(true)
    @player_2 = Player.new(false)
    @current_player = @player_1
    @choice = nil
  end 

  def print_board
    6.times do |i|
      puts "\t#{@board[i].join(" ")}"
    end
    puts "\t0 1 2 3 4 5 6"
  end

  def start_message
    system 'clear'
    puts "Welcome to Connect Four!"
    puts "Player 1 will be #{"Red".red}."
    puts "Player 2 will be #{"Blue".blue}."
    puts "Choose a column (Starting at 0) to drop your piece"
  end

  def get_choice
    puts "#{@current_player.name}, choose a column"
    valid_answers = [0,1,2,3,4,5,6]
    @choice = Integer(gets.chomp)
    if valid_answers.include?(@choice)
      return
    else
      get_choice
    end
  end

  def process_choice(vertical_pos=5, static_pos=@choice)
    
    if vertical_pos < 0
      puts "Invalid choice"
      get_choice
      return process_choice
    elsif self.board[vertical_pos][static_pos] == 
      "O".colorize(:background => :green)
      self.board[vertical_pos][static_pos] = @current_player.text_content
    else self.process_choice(vertical_pos-1, static_pos)
    end
  end

  def switch_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def game_loop
    system 'clear'
    self.start_message
    while true
      self.print_board
      self.get_choice
      self.process_choice
      self.switch_player
      system 'clear'
      self.print_board
      self.get_choice
      self.process_choice
      self.switch_player
      system 'clear'
    end
  end
end