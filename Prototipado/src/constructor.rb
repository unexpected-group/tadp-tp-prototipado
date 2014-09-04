module Constructor

  def initialize(prototipo)
    clase = Class.new
    clase.agregar_prototipo(prototipo)
    clase
  end

end

def Class
  include Constructor
end

class Jugador
  attr_accessor :goles, :edad

  def initialize(goles, edad)
    @goles = goles
    @edad = edad
  end

  def hacer_gol
    @goles += 1
  end
end