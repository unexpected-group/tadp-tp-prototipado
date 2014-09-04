class Constructor

  def initialize(prototipo)

    @prototipo = prototipo

  end

  def new(mapa = {})
    object = @prototipo.class.new
  end
end


#object.instance_methods.each {|m| self.define_method }

class Jugador
  attr_accessor :goles, :edad

  def hacer_gol
    @goles += 1
  end
end