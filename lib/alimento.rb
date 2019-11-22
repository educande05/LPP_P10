require "alimento/version"


  class Alimento

  attr_accessor :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno, :hombre, :mujer

  def initialize  (nombre, proteinas, carbohidratos, lipidos, gei, terreno)
    @nombre = nombre
    @proteinas  = proteinas
    @carbohidratos = carbohidratos
    @lipidos  = lipidos
    @gei  = gei
    @terreno = terreno
    @hombre = []
    @mujer = []

  end

  def to_s_name
    "#{@nombre}"
  end

  def to_s_proteinas
    "#{@proteinas}"
  end

  def to_s_gei
    "#{@gei}"
  end

  def to_s_terreno
    "#{@terreno}"
  end

  def clear
    @proteinas  = 0
    @carbohidratos = 0
    @lipidos  =0
    @gei  = 0
    @terreno = 0
    "El alimento #{@nombre} ahora está vacío"
  end

  def value_energy
    (4*@proteinas+9*@lipidos+4*@carbohidratos).round(2)
  end

  def eq_gei (valor_mg)
    factor=(100*valor_mg)/100000
    valor=factor*@gei
  end

  def eq_terreno (valor_mg)
    factor=(100*valor_mg)/100000
    valor=factor*@terreno
  end

end
