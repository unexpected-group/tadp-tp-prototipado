load '../src/prototipo.rb'

require 'rspec'

describe 'Prototipado - Ruby' do

  it 'Agregar una variable' do
    conan = Object.new
    conan.agregar_variable(:@vida, 100)
    expect(conan.cantidad_variables).to eq 1
    conan.vida = 200
    expect(conan.vida).to eq 200
  end

  it 'Agregar un metodo' do
    conan = Object.new
    metodo = proc {1}
    conan.agregar_metodo(:metodo, metodo)
    expect(conan.singleton_methods).to include(:metodo)
  end

  it 'Se agrega un metodo y solo se agrega en el objeto designado' do
    conan = Object.new
    zorro = Object.new
    metodo = proc {1}
    conan.agregar_metodo(:metodo, metodo)
    expect(zorro.singleton_methods.include?(:metodo)).to be false
  end

  it 'Se agrega un prototipo y se heredan los mensajes' do
    conan = Object.new
    zorro = Object.new
    metodo = proc {1}
    conan.agregar_metodo(:metodo, metodo)
    zorro.agregar_prototipo(conan)
    expect(zorro.singleton_methods.include?(:metodo)).to be true
  end

  it 'El prototipo agrega un metodo y todos sus hijos los agregan' do
    conan = Object.new
    zorro = Object.new
    atila = Object.new
    zorro.agregar_prototipo(conan)
    atila.agregar_prototipo(conan)
    metodo = proc {1}
    conan.agregar_metodo(:metodo, metodo)
    expect(atila.singleton_methods.include?(:metodo)).to be true
    expect(zorro.singleton_methods.include?(:metodo)).to be true
  end

end