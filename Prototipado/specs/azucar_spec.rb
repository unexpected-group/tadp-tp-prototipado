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
end