require_relative '../src/observable'

module Prototipo
  include Observable

  attr_accessor :prototipo, :prototiposPadres


  def initialize
    @prototiposPadres = []
  end
  # agrega una variable de instancia y crea sus accesors
  def set_property(selector, valor)
    nombre_accessor = selector
    unless selector.to_s.start_with?('@')
      selector = '@'.concat selector.to_s
    end
    self.instance_variable_set(selector, valor)
    self.class.instance_eval do
      attr_accessor nombre_accessor
    end
  end

  # agrega un nuevo singleton method
  def set_method(selector, metodo)
    self.define_singleton_method(selector, metodo)
    self.notify_method_added(selector, metodo)
  end

  # agrega un prototipo que provee solo comportamiento
  def add_prototype(prototipo)
    @prototiposPadres << prototipo
    prototipo.add_observer(self)
    self.update_methods(prototipo)
  end

  # agrega todos los metodos del prototipo
  def update_methods(prototipo)
    prototipo.methods(false).each {
        |selector|
      self.set_method(selector, prototipo.method(selector).to_proc)
    }
  end

  # devuelve la cantidad de variables de instancia de objetos
  def number_of_properties
    self.instance_variables.count
  end

  # devuelve la cantidad de metodos de instancia de objetos
  def number_of_methods
    self.methods(false).count
  end

  # devuelve un mapa con los nombres de las variables y sus valores
  def properties
    mapa = {}
    self.instance_variables.each do |selector|
      mapa[selector] = self.instance_variable_get selector
    end
    mapa
  end

  def superior(metodo)
    call_father(metodo)
  end

  def call_father(metodo)
    prototiposPadres.each {
        | prototipo|
      if prototipo.methods.include? metodo
        return prototipo.method(metodo).call
      end
    }

  end

  # se redefine para poder hacer el azucar sintactico
  def method_missing(selector, *argumentos)
    if selector.to_s[-1, 1] == '='
      if argumentos[0].is_a? Proc
        self.set_method(selector.to_s.chop.to_sym, argumentos[0])
      else
        #selector = selector.to_s.chop.insert(0, '@').to_sym
        selector = selector.to_s.chop.to_sym
        self.set_property(selector, argumentos[0])
      end
    else
      super
    end
  end

end

module Creador
  def nuevo(&bloque)
    objeto = Object.new
    objeto = bloque.call(objeto)
  end
end

class Object
  include Prototipo
  extend Creador
end