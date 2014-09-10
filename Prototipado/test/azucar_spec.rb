require 'rspec'
require '../../Prototipado/src/prototipo'
require '../../Prototipado/src/constructor'

describe 'Azucar Sintactico' do

  it 'agregar variable singleton' do
    objeto = Object.new
    objeto.vida
    #expect(objeto.vida).to eq 10
  end
end