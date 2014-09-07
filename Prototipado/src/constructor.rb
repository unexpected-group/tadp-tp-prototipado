class Constructor

  def initialize(prototipo)
    @prototipo = prototipo
  end

  # devuelve un objeto con las variables pasadas por parametro en el mapa
  def new(mapa = {})
    object = self.prototipo.class.new
    mapa.each {
        |clave, valor|
      selector = '@'.concat(clave.to_s)
      object.agregar_variable(selector.to_sym, valor)
    }
    object
  end

  # devuelve un objeto copia de un prototipo (metodo de clase)
  def self.copy(prototipo)
    clase = self.new(prototipo)
    objeto = clase.new(prototipo.instance_variables)
    objeto
  end

end

class Jugador

  attr_accessor :goles, :edad

  def hacer_gol
    self.goles += 1
  end

end

class Object
  include Prototipo

end