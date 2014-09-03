load '../src/prototipo.rb'

require 'rspec'

describe 'Prototipado - Ruby' do

  it 'Agregar una variable' do
    conan = Object.new
    conan.agregar_variable(:@vida, 100)
    expect(conan.cantidad_variables).to eq 1 # testea que se agregue la variable
    conan.vida = 200
    expect(conan.vida).to eq 200 # testea el que se generen la propiedades
  end

  it 'Agregar un metodo' do
    conan = Object.new
    metodo = proc {1}
    conan.agregar_metodo(:metodo, metodo)
    expect(conan.singleton_methods).to include(:metodo)
  end

  it 'Agregar un metodo y clonar para que otro no lo entienda' do
    conan = Object.new
    zorro = Object.new
    metodo = proc {1}
    conan.agregar_metodo(:metodo, metodo)
    expect(zorro.singleton_methods.include?(:metodo)).to be false
  end

end