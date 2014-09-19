class Constructor

  def initialize(prototipo, &bloque)
    @prototipo = prototipo
    @bloque = bloque || Proc.new {}
  end

  # devuelve un objeto con las variables pasadas por parametro en el mapa
  def nuevo(mapa = {})
    objeto = self.prototipo.clone
    objeto.add_prototype(@prototipo)
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
    @bloque.call(*argumentos)
    @prototipo
  end

  # devuelve un objeto copia de un prototipo (metodo de clase)
  def self.copy(prototipo)
    clase = self.new prototipo
    mapa = {}
    prototipo.instance_variables.each {
        |clave|
      mapa[clave] = prototipo.instance_variable_get(clave)
    }
    bloque = Proc.new { self.method(:nuevo).call(mapa) }
    clase.set_method(:crear, bloque)
    clase
  end

  def extender(&bloque)
    prototipo_extendido = @prototipo.clone
    prototipo_extendido.instance_eval &bloque
    constructor_nuevo = self.class.new prototipo_extendido
  end

end

class Jugador

  attr_accessor :goles, :edad

  def hacer_gol
    self.goles += 1
  end

end