
module Alimento 

	class MenuDSL

		attr_accessor :nombre, :descripcion, :listaPlatos, :listaPrecios, :precio

                def initialize( nombre, &block )
                        @nombre = nombre
                        @listaPlatos = []
                        @listaPrecios = []
                        if block_given?
                                if block.arity == 1
                                        yield self
                                else
                                        instance_eval(&block)
                                end
                        end
                end
                def to_s
                        output = @nombre
                        output <<  " ( #{@descripcion} ) "
                        output << " = "
                        contador = 0
                        while ( contador < @listaPlatos.size() ) do
                                output << " [ "
                                output << @listaPlatos[contador]
                                output << " + "
                                output << @listaPrecios[contador].to_s
                                output << " ] "
                                contador = contador + 1
                        end
                        output << " Precio total: #{@precio.to_s} "
                        return output
                end
                def descripcion ( descripcion )
                        @descripcion = descripcion
                end
                def componente ( options = {} )
                        @listaPlatos << options[:informacion] if
                                        options[:informacion]
                        @listaPrecios << options[:dinero] if
                                        options[:dinero]

                end
                def precio ( precio )
                        @precio = precio
                end
        end
end


