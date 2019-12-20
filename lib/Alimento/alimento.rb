#Modulo alimento, Contiene las clases de las practicas de LPP
module Alimento

  #CLase error
  class Error < StandardError; end
  
  #Clase Alimento. Contiene una lista de datos del alimento
  class Alimento
  
  include Comparable	

  #Atributos de la clase Alimento: nombre, proteinas, carbohidratos, lipidos, gei, terreno.
  attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno, :eficiencia
    def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno)
      @nombre = nombre
      @proteinas = proteinas
      @carbohidratos = carbohidratos
      @lipidos = lipidos
      @gei = gei
      @terreno = terreno
    end
    
 #Comparador
    def <=>(algo)
	if algo != nil
		getValorCalorico<=>algo.getValorCalorico
 	end   
    end
    
    #Obtiene el nombre
    def getNombre
      @nombre
    end
    #Obtiene los gases de efecto invernadero
    def getGEI
      @gei
    end

    #Obtiene el terreno
    def getTerreno
      @terreno
    end
    
    # Obtiene las proteinas del plato
    def getProteinas
      @proteinas
    end

    # Obtiene los lipidos del plato
    def getLipidos
      @lipidos
    end

    # Obtiene los carbohidratos del plato
    def getCarbohidratos
      @carbohidratos
    end
    
    #Obtiene el valor calorico del plato
    def getValorCalorico
      resultado = '%0.1f' % ((getProteinas * 4) + (getLipidos * 4) + (getCarbohidratos * 9))
      return resultado.to_f
    end

    def to_s
      "#{@nombre}"
    end

    #Obtiene las calorías del alimento
    def calcularCaloriasDieta(*valores_caloricos)
      resultado = getValorCalorico
      for valor in valores_caloricos
        resultado += valor
      end
      return resultado.round(1)
    end

    #Calcula los GEI recibiendo un puntero
    def calcularGEI(*geis)
      resultado = getGEI
      for gei in geis
        resultado += gei 
      end
      return resultado.round(2)
    end

    #Calcula terreno recibiendo un puntero
    def calcularTerreno(*terrenos)
      resultado = getTerreno
      for terreno in terrenos
        resultado += terreno 
      end
      return resultado.round(2)
    end
  end
end
