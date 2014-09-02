module Prototipo

  def agregar_variable(selector, valor)
    self.instance_variable_set(selector, valor)
    nombre = selector.to_s.delete '@'
    self.class.instance_eval do
        attr_accessor nombre
    end
  end

  def cantidad_variables
    self.instance_variables.count
  end

end

class Guerrero
  include Prototipo

end