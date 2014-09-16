require 'rspec'

require '../src/prototipo'
require '../src/constructor'

describe 'Constructores en Ruby' do

  it 'crear una clase desde un prototipo' do
    prototipo_jugador = Jugador.new
    ConstructorJugador = Constructor.new(prototipo_jugador)
    jugador = ConstructorJugador.new
    expect(jugador).to be_a(Jugador)
  end

  it 'crear un constructor por defecto' do
    prototipo_jugador = Jugador.new
    ConstructorJugador = Constructor.new(prototipo_jugador)
    jugador = ConstructorJugador.new({:goles => 5, :edad => 18})
    expect(jugador.goles).to eq 5
  end

  it 'crear un constructor que copie el estado del prototipo' do
    prototipo_jugador = Jugador.new
    prototipo_jugador.goles = 2
    ConstructorJugador = Constructor.copy(prototipo_jugador)
    jugador = ConstructorJugador.new
    expect(jugador.goles).to eq 2
  end

end