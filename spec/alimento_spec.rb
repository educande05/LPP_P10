require "spec_helper"
require "alimento"
require "Alimento/plato"


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
    expect(alimento).to have_attributes(:gei => 50.0)
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

  
RSpec.describe Alimento::Lista do

  it "has a version number" do
    expect(Alimento::VERSION).not_to be nil
  end

  it "Crea un objeto de tipo 'lista'" do
    lista = Alimento::Lista.new()
    expect(lista).to be_kind_of(Alimento::Lista)
  end

  it "Crea un objeto de tipo 'lista' con argumentos" do
    lista = Alimento::Lista.new(3, "ruby", true)
    expect(lista).to be_kind_of(Alimento::Lista)
    expect(lista.first).to eq(3)
    expect(lista.last).to eq(true)
  end

  it "Comprobar que la lista comienza vacía" do
    lista = Alimento::Lista.new()
    expect(lista.empty).to eq(true)
  end

  it "Existe nodo con datos, nodo siguiente y nodo previo" do
    lista = Alimento::Lista.new()
    lista << 5
    lista << 10
    lista << 15
    first = lista.head
    second = first.next
    third = second.next
    expect(first.value).to eq(5)
    expect(second.value).to eq(10)
    expect(third.value).to eq(15)
  end

    it "Existe lista con cabeza y cola" do
    lista = Alimento::Lista.new()
    lista << 5
    lista << "ruby"
    expect(lista.head).not_to be nil
    expect(lista.tail).not_to be nil
  end

  it "Se puede insertar un elemento en la lista" do
    lista = Alimento::Lista.new()
    lista << 8
    expect(lista.tail.value).to eq(8)
  end

  it "Se pueden insertar varios elementos en la lista" do
    lista = Alimento::Lista.new()
    lista << 3
    expect(lista.tail.value).to eq(3)
    lista << "ruby"
    expect(lista.tail.value).to eq("ruby")
    lista << true
    expect(lista.tail.value).to eq(true)
  end

    it "Se extrae el primer elemento de la lista" do
    lista = Alimento::Lista.new()
    lista << "test"
    lista << 4
    expect(lista.first).to eq("test")
  end

  it "Se extrae el último elemento de la lista" do
    lista = Alimento::Lista.new()
    lista << "test"
    lista << 4
    expect(lista.last).to eq(4)
  end

  lista_española = Alimento::Lista.new(chocolate, lentejas, nuez)
  lista_vasca = Alimento::Lista.new(salmon, huevos, lentejas, queso)
  lista_vegetaria = Alimento::Lista.new(huevos, lecheVaca, queso, chocolate)
  lista_vegetaliana = Alimento::Lista.new(tofu, lentejas, nuez)
  lista_carnivora = Alimento::Lista.new(carneVaca, carneCordero, cerveza)

  it "Estimación emisiones diarias de GEI" do
  
	alimento = lista_española.first
	sum = 0
	lista_española.each { |x| sum += x.getGEI }
    	expect(sum.round(2)).to eq(3.0)
  end

end


RSpec.describe Alimento::PlatoA do 

# Array de platos = 1 menu 
	before :all do

	@lista_carne = Alimento::Lista.new(carneVaca,carneCordero,cerdo,pollo)
	@lista_gramos_carne = Alimento::Lista.new(300,200,350,200)
	@plato_carne = Alimento::PlatoA.new("Plato de Carne", @lista_carne, @lista_gramos_carne)

	@lista_vegana = Alimento::Lista.new(lentejas,tofu,nuez,cerveza)
	@lista_gramos_vegana = Alimento::Lista.new(300,300,100,300)
	@plato_vegano = Alimento::PlatoA.new("Plato Vegano",@lista_vegana, @lista_gramos_vegana)

	@lista_mar = Alimento::Lista.new(camarones,salmon,cerveza)
	@lista_gramos_mar = Alimento::Lista.new(200,400,300)
	@plato_mar = Alimento::PlatoA.new("Plato Mar", @lista_mar, @lista_gramos_mar)

	@precios = [9.50, 7.25, 8.00] 

	@menu = [@plato_carne,@plato_vegano,@plato_mar]
#	puts @plato_carne, @plato_vegano, @plaato_mar
	@indice_energia = @menu.map { |x| if x.get_valor_calorico < 670
						1.0
					  elsif x.get_valor_calorico > 830
						3.0
					  else 
						2.0
					  end
	}

	@indice_carbono = @menu.map { |x| if x.get_gei < 800
						1.0
					  elsif x.get_gei > 1200
						3.0
					  else 
						2.0
					  end
	}

	@indice_huella_nutricional = @indice_energia.zip(@indice_carbono).map { |x| x.reduce(:+) / 2 }

	
	end
	
	it "Comprobar máxima huella nutricional" do
		expect(@menu.zip(@indice_huella_nutricional).reduce { |x,y| (x.last > y.last) ? x : y }.first).to eq(@plato_vegano)
	end

	it "Comprobar incremento de precios" do 
		expect(@precios.map { |x| x * @indice_huella_nutricional.reduce { |x,y| x > y ? x : y } }).to eq([19.0,14.5,16.0])
	
	end
end

















  
