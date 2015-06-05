class Game
  attr_accessor :player1, :player2

  def reset
    @player1 = nil
    @player2 = nil
  end

  def ready?
    @player1.selection && @player2.selection
  end

  def got_two_players?
    @player1 && @player2
  end

  def assign_player(player)
    @player1 ? @player2 = player : @player1 = player
  end

  def result
    draw? ? :draw : check_selections
  end

  def draw?
    @player1.selection == @player2.selection
  end

  def check_selections
    winning_moves = { rock: :scissors, paper: :rock, scissors: :paper }
    @player2.selection == winning_moves[@player1.selection] ? @player1 : @player2
  end
end
