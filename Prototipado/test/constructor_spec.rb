load '../src/prototipo.rb'
load '../src/constructor.rb'

require 'rspec'

describe 'Constructores en Ruby' do

  it 'crear una clase desde un prototipo' do
    prototipo = Jugador.new
    Arquero = Constructor.new(prototipo)
    arquero = Arquero.new
    expect(arquero).to be_a(Jugador)
  end

  it 'crear un constructor por defecto' do
    prototipo = Jugador.new
    Arquero = Constructor.new(prototipo)
    arquero = Arquero.new({:goles => 5, :edad => 18})
    expect(arquero.goles).to eq 5
  end

  it 'crear un constructor que copie el estado del prototipo' do
    prototipo = Jugador.new
    prototipo.goles = 2
    arquero = Constructor.copy(prototipo) # esto me devuelve de una el objeto, me tiene que devolver la clase que cree al objeto
    expect(arquero.goles).to eq 2
  end

end