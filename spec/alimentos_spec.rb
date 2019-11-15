

RSpec.describe Alimento do

    before  :each do
	    @carne_vaca = Alimento.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
      @carne_cordero = Alimento.new("Carne de cordero",18.0,0,17.0,20.0,185.0)
      @camarones = Alimento.new("Camarones (piscifactoria",17.6,1.5,0.6,18.0,2.0)
      @chocolate = Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
      @salmon = Alimento.new("Salmon (piscifactoria",19.9,0.0,13.6,6.0,3.7)
      @cerdo = Alimento.new("Cerdp",21.5,0.0,6.3,7.6,11.0)
      @pollo = Alimento.new("Pollo",20.6,0.0,5.6,5.7,7.1)
      @queso = Alimento.new("Queso",25.0,1.3,33.0,11.0,41.0)
      @cerveza = Alimento.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
      @leche= Alimento.new("Leche de vaca",3.3,4.8,3.2,3.2,8.9)
      @huevos= Alimento.new("Huevos",13.0,1.1,11.0,4.2,5.7)
      @cafe = Alimento.new("Cafe",0.1,0.0,0.0,0.4,0.3)
      @tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
      @lentejas = Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
      @nuez = Alimento.new("Nuez",20.0,21.0,54.0,0.3,7.9)

      @hombre = [@carne_vaca, @lentejas, @huevos, @cerveza]
      @mujer = [@pollo, @chocolate, @nuez, @tofu]


      def impacto_ambiental (dieta) 
	terreno_ = 0
	gei_ = 0
	dieta.each{| index |
		terreno_+=((alimento.to_s_terreno*alimento.to_s_proteinas)/1000)
		gei_+=((alimento.to_s_gei*alimento.to_s_proteinas)/1000)
	}

	puts"El impacto causado es de: #{terreno_}m² y #{gei_}kgCO²eq."
	[terreno_.round(3),gei_.round(3)]
  

      end      

    context "Comprobar Nombre" do
      it "El nombre es correcto" do
        expect(@carne_vaca.nombre).to eq("Carne de vaca")
      end

      it "Los Nutrientes son correctos" do
        expect(@carne_vaca.proteinas).to eq(21.1)
        expect(@carne_vaca.carbohidratos).to eq(0.0)
        expect(@carne_vaca.lipidos).to eq(3.1)
      end

      it "Los gases de efecto invernadero son correctos" do
        expect(@carne_vaca.gei).to eq(50.0)
      end

      it "El terreno usado en m²año es correcto" do
        expect(@carne_vaca.terreno).to eq(164.0)
      end
    end

    context "Probando el valor energetico del alimento" do
      it "El valor energetico es correcto" do
        expect(@carne_vaca.value_energy).to eq(112.30)
      end
    end

    context "Comprobando el impacto ambiental de 2 personas" do
      it "El impacto mediohambiental del hombre es correcto" do
	      expect(impacto_ambiental(@hombre)).to eq([3.615,1.119])
	end

      it "El impacto mediohambiental de la mujer es correcto" do
	      expect(impacto_ambiental(@mujer)).to eq([0.340,0.152])
        end

      end
    end
end
