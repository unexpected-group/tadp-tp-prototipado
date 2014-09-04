load '../src/prototipo.rb'
load '../src/constructor.rb'


require 'rspec'

describe 'Constructores en Ruby' do

  it 'should do something' do
    jugador_prototipo = Jugador.new(200, 25)
    Jugador = Class.new(jugador_prototipo)
    jugador2 = Jugador.new(15, 20)
    expect(jugador2.edad).to eq 25
  end
end