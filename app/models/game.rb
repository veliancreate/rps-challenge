class Game
  attr_accessor :player1, :player2

  def reset
    @player1 = nil
    @player2 = nil
  end

  def reset_selections
    @player1.selection = nil
    @player2.selection = nil
  end

  def ready?
    players_in? ? selections_chosen? : false
  end

  def game_on?
    players_in? ? names_chosen? : false
  end

  def players_in?
    !@player1.nil? && !@player2.nil?
  end

  def names_chosen?
    @player1.name && @player2.name ? true : false
  end

  def selections_chosen?
    @player1.selection && @player2.selection ? true : false
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
