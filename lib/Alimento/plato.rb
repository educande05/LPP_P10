module Alimento 

	class Plato 
	
		attr_reader :nombre, :lista_alim, :lista_gramos
	
		def initialize(nombre, lista_alim, lista_gramos)
		  @nombre = nombre
		  @lista_alim = lista_alim
		  @lista_gramos = lista_gramos	
		end

		def get_proteinas
			sum = 0
			@lista_alim.each { |x| sum += x.getProteinas }
			return sum
		end

		def get_lipidos
			sum = 0
			@lista_alim.each { |x| sum += x.getLipidos }
			return sum
		end

		def get_carbohidratos
			sum = 0
			@lista_alim.each { |x| sum += x.getCarbohidratos }
			return sum
		end

		def get_nombre
			return @nombre
		end

		def get_valor_calorico 
			sum = 0
			@lista_alim.each { |x| sum += x.getValorCalorico }
			return sum			
		end

		def get_gei 
		sum = 0
		@lista_alim.each { |x| sum += x.getGEI }
		return sum			
		end
		

		def to_s
			formato = "nombre: #{@nombre}: "
			@lista_alim.each { |x| formato += x.to_s + " " }
			return formato 
		end	
	end

	class PlatoA < Plato
		
		include Comparable
		attr_reader :nombre, :lista_alim, :lista_gramos
	
		def initialize(nombre, lista_alim, lista_gramos)
			super(nombre,lista_alim,lista_gramos)
		end

		def <=>(algo)
			get_valor_calorico<=>algo.get_valor_calorico
		end

		def get_gei
			sum = 0
			@lista_alim.each { |x| sum += x.getGEI }
			return sum
		end

		def get_terreno
			sum = 0
			@lista_alim.each { |x| sum += x.getTerreno }
			return sum
		end		
		def to_s
			formato1 = "\nvalor calorico: #{get_valor_calorico}"
			return super+formato1		
		end	

	end
end





