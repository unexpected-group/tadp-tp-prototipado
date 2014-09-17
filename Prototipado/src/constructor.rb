class Constructor

  def initialize(prototipo, &bloque)
    @prototipo = prototipo
    @bloque = bloque || Proc.new {}
  end

  # devuelve un objeto con las variables pasadas por parametro en el mapa
  def new(mapa = {})
    objeto = self.prototipo.class.new
    mapa.each {
        |clave, valor|
      if clave.to_s.start_with?('@')
        objeto.set_property(clave.to_s.delete('@'), valor)
      else
        objeto.set_property(clave, valor)
      end
    }
    objeto
  end

  def novo(*argumentos)
    @bloque.call(argumentos)
    @prototipo
  end

  alias :nuevo :new

  # devuelve un objeto copia de un prototipo (metodo de clase)
  def self.copy(prototipo)
    clase = self.new(prototipo)
    mapa = {}
    prototipo.instance_variables.each {
        |clave|
      mapa[clave] = prototipo.instance_variable_get(clave)
    }
    bloque = Proc.new { clase.method(:nuevo).call(mapa) }
    clase.set_method(:new, bloque)
    clase
  end

end

class Jugador

  attr_accessor :goles, :edad

  def hacer_gol
    self.goles += 1
  end

end