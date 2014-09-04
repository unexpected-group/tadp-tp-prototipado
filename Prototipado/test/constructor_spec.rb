load '../src/prototipo.rb'
load '../src/constructor.rb'


require 'rspec'

describe 'Constructores en Ruby' do

  it 'crear un constructor' do
    prototipo = Jugador.new
    Arquero = Constructor.new(prototipo)
    arquero = Arquero.new
    expect(arquero).to be_a(Jugador)
  end

  it 'crear un constructor' do
    prototipo = Jugador.new
    Arquero = Constructor.new(prototipo)
    arquero = Arquero.new({goles: 5, edad:18})
    expect(arquero.goles).to eq(5)
  end

end