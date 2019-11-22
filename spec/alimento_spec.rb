require "./lib/alimento.rb"
require "./lib/Lista.rb"


alimento = Alimento::Alimento.new("carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
carneVaca = Alimento::Alimento.new("carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
carneCordero = Alimento::Alimento.new("carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
camarones = Alimento::Alimento.new("camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
chocolate = Alimento::Alimento.new("chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
salmon = Alimento::Alimento.new("salmon", 19.9, 0.0, 13.6, 6.0, 3.7)
cerdo = Alimento::Alimento.new("cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
pollo = Alimento::Alimento.new("pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
queso = Alimento::Alimento.new("queso", 25.0, 1.3, 33.0, 11.0, 41.0)
cerveza = Alimento::Alimento.new("cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
lecheVaca = Alimento::Alimento.new("leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
huevos = Alimento::Alimento.new("huevos", 13.0, 1.0, 11.0, 4.2, 5.7)
cafe = Alimento::Alimento.new("cafe", 0.1, 0.0, 0.0, 0.4, 0.3)
tofu = Alimento::Alimento.new("tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
lentejas = Alimento::Alimento.new("lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
nuez = Alimento::Alimento.new("nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

RSpec.describe Alimento::Alimento do

  alimentos = [carneVaca, carneCordero, camarones, chocolate, salmon, cerdo, pollo, queso, cerveza,
               lecheVaca, huevos, cafe, tofu, lentejas, nuez]

  it "has a version number" do
    expect(Alimento::VERSION).not_to be nil
  end

  it "Crea un objeto de tipo 'alimento'" do
    expect(alimento).to be_kind_of(Alimento::Alimento)
  end

  it "Existe un nombre para el alimento" do
    expect(alimento).to have_attributes(:nombre => "carne de vaca")
  end

  it "Existe un GEI para el alimento" do
    expect(alimento).to have_attributes(:GEI => 50.0)
  end

  it "Existe un terreno para el alimento" do
    expect(alimento).to have_attributes(:terreno => 164.0)
  end

  it "Existe getter para el atributo 'nombre'" do
    expect(alimento.getNombre).to eq("carne de vaca")
  end

  it "Existe getter para el atributo 'GEI'" do
    expect(alimento.getGEI).to eq(50.0)
  end

  it "Existe getter para el atributo 'terreno'" do
    expect(alimento.getTerreno).to eq(164.0)
  end

  it "Existe método que convierte nombre a string" do
    expect(alimento.to_s).to eq("carne de vaca")
  end

  it "Existe método que calcule valor calórico para un alimento" do
    expect(alimento.getValorCalorico).to eq(96.8)
  end

  it "Existe método para evaluar si la alimentación es buena (3kcal hombre, 2.3kcal mujer)" do
    expect(cafe.calcularCaloriasDieta(chocolate.getValorCalorico * 3, lentejas.getValorCalorico,
                                      cerveza.getValorCalorico)).to eq(2295.0)
  end

  it "Existe método para calcular GEI de la dieta" do
    expect(cafe.calcularGEI(chocolate.getGEI * 3, lentejas.getGEI, cerveza.getGEI)).to eq(7.94)
  end

  it "Existe método para calcular terreno de la dieta" do
    expect(cafe.calcularTerreno(chocolate.getTerreno * 3, lentejas.getTerreno, cerveza.getTerreno)).to eq(14.12)
  end
end
