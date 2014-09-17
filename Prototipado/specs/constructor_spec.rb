require 'rspec'

require '../src/prototipo'
require '../src/constructor'

describe 'Constructores en Ruby' do

  it 'crear una clase desde un prototipo' do
    prototipo_jugador = Jugador.new
    ConstructorJugador = Constructor.new(prototipo_jugador)
    jugador = ConstructorJugador.nuevo
    expect(jugador).to be_a(Jugador)
  end

  it 'crear un constructor por defecto' do
    prototipo_jugador = Jugador.new
    ConstructorJugador = Constructor.new(prototipo_jugador)
    jugador = ConstructorJugador.nuevo({:goles => 5, :edad => 18})
    expect(jugador.goles).to eq 5
  end

  it 'crear un constructor que copie el estado del prototipo' do
    prototipo_jugador = Jugador.new
    prototipo_jugador.goles = 2
    ConstructorJugador = Constructor.copy(prototipo_jugador)
    jugador = ConstructorJugador.crear
    expect(jugador.goles).to eq 2
  end

  it 'extender un constructor' do
    prototipo_jugador = Jugador.new
    ConstructorJugador = Constructor.new(prototipo_jugador)
    ConstructorArquero = ConstructorJugador.extender {
        |atajadas|
      self.set_property(:atajadas,atajadas)
      self.set_method(:atajar, Proc.new {
        @atajadas += 1
      })
    }
    arquero = ConstructorArquero.nuevo({:goles => 5, :edad => 18, :atajadas => 5})
    puts arquero.method(:atajar)
    puts arquero.method(:hacer_gol)
    arquero.hacer_gol
    expect(arquero.goles).to eq 6
    expect(arquero.atajadas).to eq 6
  end

end