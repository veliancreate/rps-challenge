require_relative '../app/models/game'

describe 'Game' do
  let(:game) { Game.new }
  let(:player) { double :player, selection: :scissors }
  let(:computer) { double :player, selection: :scissors }

  def set_players
    game.player1 = player
    game.player2 = computer
  end

  it 'knows when it is a draw' do
    set_players
    expect(game.result).to eq(:draw)
  end

  it 'knows that paper beats rock' do
    allow(player).to receive(:selection) { :paper }
    allow(computer).to receive(:selection) { :rock }
    set_players
    expect(game.result).to eq(player)
  end

  it 'knows that rock beats scissors' do
    allow(player).to receive(:selection) { :scissors }
    allow(computer).to receive(:selection) { :rock }
    set_players
    expect(game.result).to eq(computer)
  end

  it 'knows that scissors beats paper' do
    allow(player).to receive(:selection) { :scissors }
    allow(computer).to receive(:selection) { :paper }
    set_players
    expect(game.result).to eq(player)
  end

  it 'initialises with nil players' do
    expect(game.player1).to eq(nil)
    expect(game.player2).to eq(nil)
  end

  it 'returns false when names are not set' do 
    allow(player).to receive(:name) { nil }
    allow(computer).to receive(:name) { nil }
    set_players
    expect(game.game_on?).to eq(false)
  end  

  it 'returns true when the names are set' do
    allow(player).to receive(:name) { 'Julian' }
    allow(computer).to receive(:name) { 'Jim' }
    set_players
    expect(game.game_on?).to eq(true)
  end

  it 'returns true when the moves have been made' do
    set_players
    expect(game.ready?).to eq(true)
  end

  it 'players in should be true when set' do
    expect(game.players_in?).to eq(false)
    set_players
    expect(game.players_in?).to eq(true)
  end
end
