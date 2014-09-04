module Observable

  def agregar_observador(observador)
    @observadores = @observadores || []
    @observadores << observador
  end

  def notificar_metodo_agregado(selector, metodo)
    @observadores.each {
        |observador|
      observador.agregar_metodo(selector, metodo) unless observador.methods(false).include?(selector)
    } unless @observadores.nil?
  end

end