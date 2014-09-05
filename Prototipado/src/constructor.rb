class Constructor

  def initialize(prototipo)
    @prototipo = prototipo
  end

  def new(mapa = {})
    object = @prototipo.class.new
    mapa.each { |clave, valor|
      object.agregar_variable(:@clave, valor)}
    object
  end
end

class Jugador
  attr_accessor :goles, :edad

  def hacer_gol
    @goles += 1
  end
end