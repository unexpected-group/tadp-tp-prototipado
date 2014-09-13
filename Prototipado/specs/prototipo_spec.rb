load '../src/prototipo.rb'

require 'rspec'

describe 'Prototipado en Ruby' do

  it 'Se agrega una variable' do
    conan = Object.new
    conan.set_property(:@vida, 100)
    expect(conan.number_of_properties).to eq 1
    conan.vida = 200
    expect(conan.vida).to eq 200
  end

  it 'Se agrega un metodo' do
    conan = Object.new
    metodo = proc { 1 }
    conan.set_method(:metodo, metodo)
    expect(conan.singleton_methods).to include(:metodo)
  end

  it 'Se agrega un metodo a un objeto y no se agrega en la clase' do
    conan = Object.new
    zorro = Object.new
    metodo = proc { 1 }
    conan.set_method(:metodo, metodo)
    expect(zorro.singleton_methods.include?(:metodo)).to be false
  end

  it 'Un objeto contiene todos los metodos de su prototipo' do
    conan = Object.new
    zorro = Object.new
    metodo = proc { 1 }
    conan.set_method(:metodo, metodo)
    zorro.add_prototype(conan)
    expect(zorro.singleton_methods.include?(:metodo)).to be true
    expect(zorro.methods(false).count).to eq conan.methods(false).count
  end

  it 'Se agrega un metodo al prototipo y todos sus objetos dependientes lo agregan' do
    conan = Object.new
    zorro = Object.new
    atila = Object.new
    zorro.add_prototype(conan)
    atila.add_prototype(conan)
    metodo = proc { 1 }
    conan.set_method(:metodo, metodo)
    expect(atila.singleton_methods.include?(:metodo)).to be true
    expect(zorro.singleton_methods.include?(:metodo)).to be true
  end

  it 'Se agrega un metodo a un objeto y su prototipo no se ve afectado' do
    conan = Object.new
    zorro = Object.new
    metodo = proc { 1 }
    zorro.set_method(:metodo, metodo)
    zorro.add_prototype(conan)
    expect(conan.singleton_methods.include?(:metodo)).to be false
  end

  it 'Se agrega una variable a un objeto y su prototipo no se ve afectado' do
    conan = Object.new
    zorro = Object.new
    conan.set_property(:@edad, 20)
    zorro.add_prototype(conan)
    expect(zorro.instance_variables.include?(:@edad)).to be false
  end

  it 'Se redefine un metodo en el prototipo y los objetos dependientes no cambian su comportamiento' do
    conan = Object.new
    atila = Object.new
    conan.set_method(:metodo, proc {"definicion original"})
    atila.add_prototype(conan)
    conan.set_method(:metodo, proc {"redefinicion"})
    expect(atila.metodo).to eq "definicion original"
  end

end