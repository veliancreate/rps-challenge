helpers do
  def player
    GAME.player1.object_id == session[:player_id] ? GAME.player1 : GAME.player2
  end

  def opponent
    player == GAME.player1 ? GAME.player2 : GAME.player1
  end

  def player_selection
    player.selection
  end

  def player_name
    player.name
  end

  def result
    GAME.result
  end

  def ready?
    GAME.ready?
  end

  def result_message
    return 'Draw' if result == :draw
    result == player ? 'Win' : 'Lose'
  end
end
