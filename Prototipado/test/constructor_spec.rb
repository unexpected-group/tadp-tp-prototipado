require 'rspec'

require_relative '../src/prototipo'
require_relative '../src/constructor'

describe 'Constructores en Ruby' do

  it 'crear una clase desde un prototipo' do
    prototipo_jugador = Jugador.new
    constructor_jugador = Constructor.new(prototipo_jugador)
    jugador = constructor_jugador.nuevo
    expect(jugador).to be_a(Jugador)
  end

  it 'crear un constructor por defecto' do
    prototipo_jugador = Jugador.new
    constructor_jugador = Constructor.new(prototipo_jugador)
    jugador = constructor_jugador.nuevo({:goles => 5, :edad => 18})
    expect(jugador.goles).to eq 5
  end

  it 'crear un constructor que copie el estado del prototipo' do
    prototipo_jugador = Jugador.new
    prototipo_jugador.goles = 2
    constructor_jugador = Constructor.copy(prototipo_jugador)
    jugador = constructor_jugador.crear
    expect(jugador.goles).to eq 2
  end

  it 'extender un constructor' do
    prototipo_jugador = Jugador.new
    constructor_jugador = Constructor.new(prototipo_jugador)
    constructor_arquero = constructor_jugador.extender do
        |atajadas|
      self.set_property(:atajadas,atajadas)
      self.set_method(:atajar, Proc.new {
        @atajadas += 1
      })
    end
    arquero = constructor_arquero.nuevo({:goles => 5, :edad => 18, :atajadas => 5})
    puts arquero.method(:atajar)
    puts arquero.method(:hacer_gol)
    arquero.hacer_gol
    expect(arquero.goles).to eq 6
    expect(arquero.atajadas).to eq 6
  end

end