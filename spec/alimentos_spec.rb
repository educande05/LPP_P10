

RSpec.describe Alimentos do

    before  :each do
      @carne_vaca = Alimentos.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
      @carne_cordero = Alimentos.new("Carne de cordero",18.0,0,17.0,20.0,185.0)
      @camarones = Alimentos.new("Camarones (piscifactoria",17.6,1.5,0.6,18.0,2.0)
      @chocolate = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
      @salmon = Alimentos.new("Salmon (piscifactoria",19.9,0.0,13.6,6.0,3.7)
      @cerdo = Alimentos.new("Cerdp",21.5,0.0,6.3,7.6,11.0)
      @pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
      @queso = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
      @cerveza = Alimentos.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
      @leche= Alimentos.new("Leche de vaca",3.3,4.8,3.2,3.2,8.9)
      @huevos= Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
      @cafe = Alimentos.new("Cafe",0.1,0.0,0.0,0.4,0.3)
      @tofu = Alimentos.new("Tofu",8.0,1.9,4.8,2.0,2.2)
      @lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
      @nuez = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)
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
        expect((@leche.eq_gei(200)).to eq(0.64))
        expect((@leche.eq_terreno(200)).to eq(1.78))

        expect((@queso.eq_gei(40)).to eq(4.4))
        expect((@queso.eq_terreno(40)).to eq(16.4))

        expect((@carne_vaca.eq_gei(200)).to eq(10))
        expect((@carne_vaca.eq_terreno(200)).to eq(32.8))
        expect((@huevos.eq_gei(120)).to eq(0.504))
        expect((@huevos.eq_terreno(120)).to eq(0.684))
        expect((@cerveza.eq_gei(250)).to eq(0.06))
        expect((@cerveza.eq_terreno(250)).to eq(0.55))
        expect((@lentejas.eq_gei(200)).to eq(0.08))
        expect((@lentejas.eq_terreno(200)).to eq(0.68))

        expect((@salmon.eq_gei(130)).to eq(0.78))
        expect((@salmon.eq_terreno(130)).to eq(0.481))
        expect((@nuez.eq_gei(25)).to eq(0.0075))
        expect((@nuez.eq_terreno(25)).to eq(0.1975))

      end
    end
end
