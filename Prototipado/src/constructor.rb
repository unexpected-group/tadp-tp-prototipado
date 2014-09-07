class Constructor

  def initialize(prototipo)
    @prototipo = prototipo
  end

  def new(mapa = {})
    object = self.prototipo.class.new
    mapa.each {
        |clave, valor|
      selector = '@'.concat(clave.to_s)
      object.agregar_variable(selector.to_sym, valor)
    }
    object
  end
end

class Jugador

  attr_accessor :goles, :edad

  def hacer_gol
    self.goles += 1
  end
end