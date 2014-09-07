require '../src/observable'

module Prototipo
  include Observable

  attr_accessor :prototipo

  # agrega una variable de instancia y crea sus accesors
  def agregar_variable(selector, valor)
    self.instance_variable_set(selector, valor)
    nombre = selector.to_s.delete '@' # porque esto
    self.class.instance_eval do
      attr_accessor nombre
    end
  end

  # agrega un nuevo singleton method
  def agregar_metodo(selector, metodo)
    self.define_singleton_method(selector) do
      metodo
    end
    self.notificar_metodo_agregado(selector, metodo)
  end

  # agrega un prototipo que provee solo comportamiento
  def agregar_prototipo(prototipo)
    prototipo.agregar_observador(self)
    self.actualizar_metodos(prototipo)
  end

  # agrega todos los metodos del prototipo
  def actualizar_metodos(prototipo)
    prototipo.methods(false).each {
        |selector|
      self.agregar_metodo(selector, prototipo.method(selector))
    }
  end

  # devuelve la cantidad de variables de instancia de objetos
  def cantidad_variables
    self.instance_variables.count
  end

  # devuelve la cantidad de metodos de instancia de objetos
  def cantidad_metodos
    self.methods(false).count
  end

  # devuelve un mapa con los nombres de las variables y sus valores
  def variables
    mapa = {}
    self.instance_variables.each do |selector|
      mapa[selector] = self.instance_variable_get selector
    end
    mapa
  end

end