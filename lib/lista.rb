require "alimento/version"

class Error < StandardError; end

module Alimento

  Nodo = Struct.new(:value, :next, :prev)

  class Lista

    attr_reader :head, :tail


    def initialize(*values)
      @head = Nodo.new(nil, nil, nil)
      @tail = @head

      if values != nil
        values.each { |value| unshift(value) }
      end

    end
