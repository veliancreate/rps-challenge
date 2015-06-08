helpers do
  def player
    GAME.player1.object_id == session[:player_id] ? GAME.player1 : GAME.player2
  end

  def opponent
    player == GAME.player1 ? GAME.player2 : GAME.player1
  end

  def player_selection
    player ? player.selection : false
  end

  def player_name
    player ? player.name : false
  end

  def result
    GAME.result
  end

  def ready?
    GAME.ready?
  end

  def result_message
    return 'Draw' if result == :draw
    return 'Win' if result == player
    return 'Lose' if result == opponent
  end

  def opponent_name
    opponent ? opponent.name : false
  end

  def opponent_selection
    opponent ? opponent.selection : false
  end

  def game_on?
    GAME.game_on?
  end
end
