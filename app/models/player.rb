class Player
  attr_accessor :name, :selection

  def computer_selection
    @selection = [:rock, :paper, :scissors].sample
  end
end
