

#Modulo alimento, Contiene las clases de las practicas de LPP
module Alimento

  #CLase error
  class Error < StandardError; end

  Nodo = Struct.new(:value, :next, :prev)

  #Clase Lista Contiene una lista
  class Lista
 
    #Enumerable   
    include Enumerable
    
    #Comparable
    include Comparable

    #Atributos; head, tail
    attr_reader :head, :tail

    #Constructor de Lista
    def initialize(*values)
      @head = Nodo.new(nil, nil, nil)
      @tail = @head

      if values != nil
        values.each { |value| unshift(value) }
      end

    end
    #Comprueba si lista esta vacía
    def empty
      @head.value == nil
    end

    #Devuelve el tamaño de Lista
    def size
      if empty
        0
      elsif head == tail && head.value != nil
        1
      else
        i = 1
        aux = @head
        while aux != @tail
          i += 1
          aux = aux.next
        end
        i
      end
    end

    #Devuelve el tamaño de Lista
    def size
      if empty
        0
      elsif head == tail && head.value != nil
        1
      else
        i = 1
        aux = @head
        while aux != @tail
          i += 1
          aux = aux.next
        end
        i
      end
    end
    
    #Añade un nuevo elemento a la lista
    def unshift(value)
      if empty
        @head.value = value
      elsif size == 1
        @tail = Nodo.new(value, nil, @head)
        @head.next = @tail
      else
        aux = Nodo.new(@tail.value, nil, @tail.prev)
        pre_tail = @tail.prev
        @tail = Nodo.new(value, nil, aux)
        aux.next = @tail
        pre_tail.next = aux
      end
    end
    
    #Añade un nuevo elemento a la lista
    def <<(value)
      unshift(value)
    end
 
    #Devuelve el primer valor de la lista
    def first
      @head.value
    end

    #Devuelve el ultimo valor de la lista   
    def last
      @tail.value
    end
    
    #Comparador
    def <=>(algo)
    end
 
    #Devuelve cada valor de la lista
    def each
	aux = @head
	while(aux != nil)
		yield aux.value
		aux = aux.next
	end
    end

  end
end
