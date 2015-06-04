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

  def opponent_selection
    opponent.selection
  end

  def game_on?
    GAME.got_two_players?
  end

  def player_name
    player.name
  end

  def opponent_name
    opponent.name
  end

  def result
    GAME.result
  end
end
