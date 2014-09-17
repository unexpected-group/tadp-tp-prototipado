require 'rspec'

require '../src/prototipo'
require '../src/constructor'

describe 'Azucar Sintactico' do

  it 'agregar variable singleton' do
    objeto = Object.new
    objeto.vida = 10
    expect(objeto.vida).to eq 10
  end

  it 'agregar metodo singleton' do
    objeto = Object.new
    objeto.saludar = Proc.new {'Hola'}
    expect(objeto.saludar).to eq 'Hola'
  end

  it 'Crear un prototipo sin repetir el receptor muchas veces' do
    objetoPrototipo = Object.nuevo {
        |prototipo|
      prototipo.energia = 100
      prototipo.saludar = Proc.new { "Hola" }
      prototipo
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