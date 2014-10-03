module Observable

  def add_observer(observador)
    @observadores ||= []
    @observadores << observador
  end

  def notify_method_added(selector, metodo)
    @observadores.each {
        |observador|
      observador.set_method(selector, metodo) unless observador.methods(false).include?(selector)
    } unless @observadores.nil?
  end

end
