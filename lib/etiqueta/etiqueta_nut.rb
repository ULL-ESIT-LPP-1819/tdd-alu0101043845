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
end
