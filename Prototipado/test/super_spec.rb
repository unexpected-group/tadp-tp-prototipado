require 'rspec'

require_relative '../src/prototipo'

describe 'Super prototypes' do

  it 'Tenes varios prototipos padres' do
    juan = Object.new
    pablo = Object.new
    objeto = Object.new
    juan.set_method(:saludar, Proc.new {'Juan'})
    pablo.set_method(:saludar, Proc.new {'Pablo'})
    objeto.add_prototype(juan)
    objeto.add_prototype(pablo)
    objeto.set_method(:saludar, Proc.new {'Yo'})
    expect(objeto.prototipos_padres.size).to eq 2
    expect(objeto.saludar).to eq 'Yo'
  end

  it 'Llamar a super y que use el metodo del primer prototipo agregado' do
    juan = Object.new
    pablo = Object.new
    objeto = Object.new
    juan.set_method(:saludar, Proc.new {'Juan'})
    pablo.set_method(:saludar, Proc.new {'Pablo'})
    objeto.add_prototype(juan)
    objeto.add_prototype(pablo)
    objeto.set_method(:saludar, Proc.new {self.superior(:saludar) + ' y Yo'})
    expect(objeto.saludar).to eq 'Juan y Yo'
  end


end