require "./lib/pawn.rb"

describe Pawn do
  it 'renders its sprite correctly' do
    expect(Pawn.new(0).render).to eq("⚫")
    expect(Pawn.new(1).render).to eq("⚪")
  end
end