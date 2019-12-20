#Modulo alimento, Contiene las clases de las practicas de LPP
module Alimento 
	
	#Clase Plato. Contiene una lista de alimentos con un peso relacionado
	class Plato 
	
		attr_reader :nombre, :lista_alim, :lista_gramos
		
		#Constructor de la clase plato 
		def initialize(nombre, lista_alim, lista_gramos)
		  @nombre = nombre
		  @lista_alim = lista_alim
		  @lista_gramos = lista_gramos	
		end
		# Obtiene las proteinas del plato
		def get_proteinas
			sum = 0
			@lista_alim.each { |x| sum += x.getProteinas }
			return sum
		end
		# Obtiene los lipidos del plato
		def get_lipidos
			sum = 0
			@lista_alim.each { |x| sum += x.getLipidos }
			return sum
		end

		# Obtiene los carbohidratos del plato
		def get_carbohidratos
			sum = 0
			@lista_alim.each { |x| sum += x.getCarbohidratos }
			return sum
		end

		# Obtiene el nombre del plato
		def get_nombre
			return @nombre
		end
		#Obtiene el valor calorico del plato
		def get_valor_calorico 
			sum = 0
			@lista_alim.each { |x| sum += x.getValorCalorico }
			return sum			
		end
		#Obtiene los gases de efecto invernadero del plato
		def get_gei 
		sum = 0
		@lista_alim.each { |x| sum += x.getGEI }
		return sum			
		end
		
		#Obtiene un string de la clase plato y su contenido
		def to_s
			formato = "nombre: #{@nombre}: "
			@lista_alim.each { |x| formato += x.to_s + " " }
			return formato 
		end	
	end

	class PlatoA < Plato
		
		include Comparable
		attr_reader :nombre, :lista_alim, :lista_gramos
		#Constructor de la clase PlatoA heredada de Plato
		def initialize(nombre, lista_alim, lista_gramos)
			super(nombre,lista_alim,lista_gramos)
		end
		#Comparador 
		def <=>(algo)
			get_valor_calorico<=>algo.get_valor_calorico
		end
		#Obtiene los gases de efecto invernadero
		def get_gei
			sum = 0
			@lista_alim.each { |x| sum += x.getGEI }
			return sum
		end
		#Obtiene el terreno
		def get_terreno
			sum = 0
			@lista_alim.each { |x| sum += x.getTerreno }
			return sum
		end		

		#Obtiene un string de la clase PlatoA
		def to_s
			formato1 = "\nvalor calorico: #{get_valor_calorico}"
			return super+formato1		
		end	

	end
end





