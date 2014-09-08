class Constructor

  def initialize(prototipo)
    @prototipo = prototipo
  end

  # devuelve un objeto con las variables pasadas por parametro en el mapa
  def new(mapa = {})
    objeto = self.prototipo.class.new
    mapa.each {
        |clave, valor|
      selector = ''
      if clave.to_s.start_with?('@')
        selector = clave.to_s
      else
        selector = '@'.concat(clave.to_s)
      end
      objeto.agregar_variable(selector.to_sym, valor)
    }
    objeto
  end

  # devuelve un objeto copia de un prototipo (metodo de clase)
  def self.copy(prototipo)
    clase = self.new(prototipo)
    mapa = {}
    prototipo.instance_variables.each {
        |clave|
      mapa[clave] = prototipo.instance_variable_get(clave)
      mapa
    }
    bloque = Proc.new {instance_method(:new).call(mapa)}
    clase.agregar_metodo(:new, bloque)
    clase
  end

end

class Jugador

  attr_accessor :goles, :edad

  def hacer_gol
    self.goles += 1
  end

end