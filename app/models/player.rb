class Player
  attr_accessor :name, :selection

  def initialize
    @selection = nil
  end

  def computer_selection
    @selection = [:rock, :paper, :scissors].sample
  end
end
