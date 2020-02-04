require "./lib/board.rb"
require "./lib/pawn.rb"

describe Board do
  b = Board.new
  it "board is 6x6" do
    y = 0
    x = 0
    b.get_ary.each do |row|
      y+=1
      row.each do
        x+=1
      end
    end
    expect(y).to eql(6)
    expect(x).to eql(36)
  end
  it "board renders correctly if empty" do
    puts "\n"
    b.render
  end
  it "board accepts node" do
    b.drop_at(0, 0)
    expect(b.get_ary[0][0].render).to eql("⚫")
    b.drop_at(0, 0)
    expect(b.get_ary[1][0].render).to eql("⚫")
    b.drop_at(1, 1)
    expect(b.get_ary[0][1].render).to eql("⚪")
  end
  it "board denies node if overfill" do
    b.drop_at(0, 0)
    b.drop_at(0, 0)
    b.drop_at(0, 0)
    b.drop_at(0, 0)
    expect(b.drop_at(0, 0)).to eql("error")
  end
  it 'recognizes state' do
    b = Board.new
    expect(b.won?).to eql(false)
    b.drop_at(0, 0)
    b.drop_at(0, 0)
    b.drop_at(0, 0)
    b.drop_at(0, 0)
    expect(b.won?).to eql(true)
    b = Board.new
    b.drop_at(1, 0)
    b.drop_at(1, 0)
    b.drop_at(1, 0)
    b.drop_at(1, 0)
    expect(b.won?).to eql(true)
    b = Board.new
    b.drop_at(0, 0)
    b.drop_at(1, 0)
    b.drop_at(2, 0)
    b.drop_at(3, 0)
    expect(b.won?).to eql(true)
    b = Board.new
    b.drop_at(0, 0)
    b.drop_at(1, 1)
    b.drop_at(2, 0)
    b.drop_at(3, 0)
    expect(b.won?).to eql(false)
    # diagonal
    b = Board.new
    b.drop_at(0, 0)
    b.drop_at(1, 1)
    b.drop_at(1, 0)
    b.drop_at(2, 1)
    b.drop_at(2, 1)
    b.drop_at(2, 0)
    b.drop_at(3, 1)
    b.drop_at(3, 1)
    b.drop_at(3, 1)
    b.drop_at(3, 0)
    expect(b.won?).to eql(true)
    b = Board.new
    b.drop_at(5-0, 0)
    b.drop_at(5-1, 1)
    b.drop_at(5-1, 0)
    b.drop_at(5-2, 1)
    b.drop_at(5-2, 1)
    b.drop_at(5-2, 0)
    b.drop_at(5-3, 1)
    b.drop_at(5-3, 1)
    b.drop_at(5-3, 1)
    b.drop_at(5-3, 0)
    expect(b.won?).to eql(true)
    # diagonal loose
    b = Board.new
    # b.drop_at(5-0, 1)
    b.drop_at(5-1, 1)
    b.drop_at(5-1, 0)
    b.drop_at(5-2, 1)
    b.drop_at(5-2, 1)
    b.drop_at(5-2, 0)
    b.drop_at(5-3, 1)
    b.drop_at(5-3, 1)
    b.drop_at(5-3, 1)
    b.drop_at(5-3, 0)
    expect(b.won?).to eql(false)
  end
end