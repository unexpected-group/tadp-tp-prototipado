require '../src/observable'

module Prototipo
  include Observable

  def agregar_variable(selector, valor) # agrega una variable de instancia y sus accesors
    self.instance_variable_set(selector, valor)
    nombre = selector.to_s.delete '@'
    self.class.instance_eval do
      attr_accessor nombre
    end
  end

  def agregar_metodo(selector, metodo) # agrega un nuevo singleton method
    self.define_singleton_method(selector) do
      metodo
    end
    self.notificar_metodo_agregado(selector, metodo)
  end

  def agregar_prototipo(prototipo) # para agregar solo comportamiento
    prototipo.agregar_observador(self)
    self.actualizar_metodos(prototipo)
  end


  def actualizar_metodos(prototipo) # agrega todos los metodos del prototipo recien agregado
    prototipo.methods(false).each {
        |selector|
      self.agregar_metodo(selector, prototipo.method(selector))
    }
  end

  def cantidad_variables
    self.instance_variables.count
  end

end

class Object
  include Prototipo
end