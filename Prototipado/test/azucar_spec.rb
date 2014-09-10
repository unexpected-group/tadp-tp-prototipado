require 'rspec'
require '../../Prototipado/src/prototipo'
require '../../Prototipado/src/constructor'

describe 'Azucar Sintactico' do

  it 'agregar variable singleton' do
    objeto = Object.new
    objeto.prop_vida(10)
    expect(objeto.vida).to eq 10
  end

  it 'agregar metodo singleton' do
    objeto = Object.new
    objeto.met_saludar(Proc.new {'Hola'})
    expect(objeto.saludar).to eq 'Hola'
  end
end