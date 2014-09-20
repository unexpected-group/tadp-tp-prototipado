require 'rspec'

require_relative '../src/prototipo'
require_relative '../src/constructor'

describe 'Azucar Sintactico' do

  subject(:objeto) { Object.new }

  it 'agregar variable singleton' do
    objeto.vida = 10
    expect(objeto.vida).to eq 10
  end

  it 'agregar metodo singleton' do
    objeto.saludar = Proc.new {'Hola'}
    expect(objeto.saludar).to eq 'Hola'
  end

  it 'Crear un prototipo sin repetir el receptor muchas veces' do
    objetoPrototipo = Object.nuevo {
      self.energia = 100
      self.saludar = Proc.new { "Hola" }
      self
    }
    expect(objetoPrototipo.energia).to eq 100
    expect(objetoPrototipo.saludar).to eq "Hola"
  end

  # Esta mal
  it 'Crear Constructor' do
    prototipoJugador = Jugador.new
    Arquero = Constructor.new(prototipoJugador) do
      |atajadas|
      prototipoJugador.atajadas = atajadas
    end
    arquero = Arquero.novo(10)
    expect(arquero.atajadas).to eq 10
  end

end