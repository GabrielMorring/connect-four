require_relative "../lib/game"
require_relative "../lib/player"

describe Game do
  describe "#player_turn" do
    subject(:game_turn) { Game.new }
    let(:player) { double("player") }

    it "updates board" do
      allow(player).to receive(:gets).and_return("a")
      allow(player).to receive(:select_column).and_return(:a)
      game_turn.player_turn
      board = game_turn.instance_variable_get(:@board)
      expect(board[:a]).to eq([0])
    end
  end
end
