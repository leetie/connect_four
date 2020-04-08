class Player
  attr_reader :text_content, :name

  def initialize(player_one=true)
    if player_one == true
      @text_content = "X".colorize(:background => :red)
      @name = "Player_1"
    else
      @text_content = "X".colorize(:background => :blue)
      @name = "Player_2"
    end
  end
end