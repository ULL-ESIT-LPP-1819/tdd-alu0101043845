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

	def push_back(nodo)
		if(@tam == 0)
			@head = nodo
			@head.prev = nil
		else
			@tail.next = nodo
			nodo.prev = @tail
		end
		@tail = nodo
		@tail.next = nil
		@tam = @tam + 1
	end

	def pop_front()
		if(@tam == 0)
			"La lista está vacía"
		else
			@head.next.prev = nil
			@head = @head.next
			@tam = @tam - 1
		end
	end

	def pop_back()
		if(@tam == 0)
			"La lista está vacía"
		else
			@tail.prev.next = nil
			@tail = @tail.prev
			@tam = @tam - 1
		end 
	end

	def order_by_salt()
		if(@tam == 0)
			"La lista está vacía"
		else
	
			aux = @head
			while aux.next != nil
				aux2 = aux.next
				while aux2 != nil
					if(aux.value.sal > aux2.value.sal)
						max = aux2.value
						aux2.value = aux.value
						aux.value = max

					end
					aux2 = aux2.next
				end
				aux = aux.next
			end
		end
	end

					

end
