require_relative "../lib/player"

describe Player do
  subject(:player) { Player.new(game) }
  board = { a: [], b: [1, 2, 1], c: [], d: [1, 1, 2, 1, 2, 2], e: [], f: [2], g: [] }
  let(:game) { double("game", board: board) }

  describe "#make_move" do
    context "when given invalid inputs" do
      it "prints invalid twice" do
        allow(player).to receive(:gets).and_return("h", "d", "f")
        allow(player).to receive(:puts)

        expect(player).to receive(:puts).with("Invalid").twice
        player.select_column
      end

      it "prints invalid once" do
        allow(player).to receive(:gets).and_return("ab", "c")
        allow(player).to receive(:puts)

        expect(player).to receive(:puts).with("Invalid").once
        player.select_column
      end
    end
  end
end
