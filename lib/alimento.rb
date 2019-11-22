require "alimento/version"

module Alimento
  class Error < StandardError; end
  # Your code goes here...
  class Alimento
    attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :GEI, :terreno
    def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno)
      @nombre = nombre
      @proteinas = proteinas
      @carbohidratos = carbohidratos
      @lipidos = lipidos
      @GEI = gei
      @terreno = terreno
    end
    
    def getNombre
      @nombre
    end

    def getGEI
      @GEI
    end

    def getTerreno
      @terreno
    end

    def getProteinas
      @proteinas
    end

    def getLipidos
      @lipidos
    end

    def getCarbohidratos
      @carbohidratos
    end

    def getValorCalorico
      resultado = '%0.1f' % ((getProteinas * 4) + (getLipidos * 4) + (getCarbohidratos * 9))
      return resultado.to_f
    end

    def to_s
      "#{@nombre}"
    end

    def calcularCaloriasDieta(*valores_caloricos)
      resultado = getValorCalorico
      for valor in valores_caloricos
        resultado += valor
      end
      return resultado.round(1)
    end

    def calcularGEI(*geis)
      resultado = getGEI
      for gei in geis
        resultado += gei 
      end
      return resultado.round(2)
    end

    def calcularTerreno(*terrenos)
      resultado = getTerreno
      for terreno in terrenos
        resultado += terreno 
      end
      return resultado.round(2)
    end
  end
end
