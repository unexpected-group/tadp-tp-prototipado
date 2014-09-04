module Constructor

  def initialize(prototipo)
    objeto = Class.new
    objeto.agregar_metodo(:initialize, proc {
      |mapa|
      mapa.each_key { |clave|
      clave = mapa[clave]
      }
    })
  objeto
  end
end

def Class
  include Constructor
end

class Jugador
  attr_accessor :goles, :edad

  def hacer_gol
    @goles += 1
  end
end