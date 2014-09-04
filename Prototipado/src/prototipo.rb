require '../src/observable'

module Prototipo

  def agregar_variable(selector, valor)
    self.instance_variable_set(selector, valor)
    nombre = selector.to_s.delete '@'
    self.class.instance_eval do
      attr_accessor nombre
    end
  end

  def agregar_metodo(selector, metodo)
    self.define_singleton_method(selector) do
      metodo
    end
  end

  def agregar_prototipo(prototipo)
    agregar_observable
    actualizar_metodos_del_prototipo
  end

  def actualizar_metodos_del_prototipo
    @prototipo.methods(false).each { |metodo| self.define_singleton_method()  }
  end

  def cantidad_variables
    self.instance_variables.count
  end

end

class Object
  include Prototipo
  include Observable

end