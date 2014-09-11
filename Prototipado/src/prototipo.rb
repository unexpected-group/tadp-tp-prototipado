require '../src/observable'

module Prototipo
  include Observable

  attr_accessor :prototipo

  # agrega una variable de instancia y crea sus accesors
  def agregar_variable(selector, valor)
    self.instance_variable_set(selector, valor)
    nombre = selector.to_s.delete '@'
    self.class.instance_eval do
      attr_accessor nombre
    end
  end

  # agrega un nuevo singleton method
  def agregar_metodo(selector, metodo)
    self.define_singleton_method(selector, metodo)
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
      self.agregar_metodo(selector, prototipo.method(selector).to_proc)
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

  def method_missing(selector, *argumentos, &block)
    if  selector.to_s.start_with?('prop')
      array = selector.to_s.split('_')
      nombre = '@'.concat(array[1])
      self.agregar_variable(nombre.to_sym, argumentos[0])

    elsif selector.to_s.start_with?('met')
      array = selector.to_s.split('_')
      nombre = array[1]
      self.agregar_metodo(nombre.to_sym, block)

    else
      super
    end
  end
end

class Object
  include Prototipo
end




