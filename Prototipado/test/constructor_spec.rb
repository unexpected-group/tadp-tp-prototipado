load '../src/prototipo.rb'
load '../src/constructor.rb'


require 'rspec'

describe 'Constructores en Ruby' do

  it 'should do something' do
    prototipo = Object.new
    prototipo.agregar_variable(:@vida, 20)
    Jugador = Class.new(prototipo)
    jugador = Jugador.new({vida: 15})
    expect(jugador.vida).to eq 15
  end
end