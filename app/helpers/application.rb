helpers do
  def player
    GAME.player1.object_id == session[:player_id] ? GAME.player1 : GAME.player2
  end

  def player_selection
    player.selection
  end

  def player_name
    player.name
  end

  def opponent
    player == GAME.player1 ? GAME.player2 : GAME.player1
  end

  def result
    GAME.result
  end

  def result_message
    if result == :draw then return "Draw" end
    result == player ? "Win" : "Lose"
  end  
end
