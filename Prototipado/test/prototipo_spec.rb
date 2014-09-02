load '../src/prototipo.rb'

require 'rspec'

describe 'Prototipado - Ruby' do

  it 'Agregar una variable' do
    conan = Guerrero.new
    conan.agregar_variable(:@vida, 100)
    expect(conan.cantidad_variables).to eq 1 # testea que se agregue la variable
    conan.vida = 200
    expect(conan.vida).to eq 200 # testea el que se generen la propiedades
  end

end