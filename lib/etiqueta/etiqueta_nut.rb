Node = Struct.new(:value, :next, :prev)

class Etiqueta_nut
	attr_reader :name, :grasas, :grasas_sat, :hidratos, :azucar, :proteina, :sal
	def initialize(n, g, gs, h, a, p, s)
		@name, @grasas, @grasas_sat, @hidratos, @azucar, @proteina, @sal = n, g, gs, h, a, p, s
	end

	def to_s()
		"(\"#{@name}\",#{@grasas},#{@grasas_sat},#{@hidratos},#{@azucar},#{@proteina},#{@sal})"
	end
end

class Lista
	attr_reader :tam, :head, :tail

	def initialize()
		@tam, @head, @tail = 0, nil, nil
	end

	def push(nodo)
		if(@tam == 0)
			@tail = nodo
			@tail.next = nil 
		else
			@head.prev = nodo
			nodo.next = @head
		end
		@head = nodo
		@head.prev = nil
		@tam = @tam + 1
	end
end
