helpers do 
  def opponent_name
    opponent.name
  end 

  def opponent_selection
    opponent.selection
  end

  def game_on?
    GAME.got_two_players?
  end
end  