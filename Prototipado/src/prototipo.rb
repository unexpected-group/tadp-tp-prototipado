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
    @prototipo = prototipo
    actualizar_metodos_del_prototipo
  end

  def actualizar_metodos_del_prototipo
    # TAREA PARA SHEN LONG
  end

  def cantidad_variables
    self.instance_variables.count
  end

end

class Object
  include Prototipo
end