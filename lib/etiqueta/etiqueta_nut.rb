Node = Struct.new(:value, :next, :prev)
	
	class Etiqueta_nut
		include Comparable
		attr_reader :name, :grasas, :grasas_sat, :hidratos, :azucar, :proteina, :sal, :fibra
		def initialize(n, g, gs, h, a, p, s, f)
			@name, @grasas, @grasas_sat, @hidratos, @azucar, @proteina, @sal, @fibra = n, g, gs, h, a, p, s, f
		end

		def to_s()
			"(\"#{@name}\",#{@grasas},#{@grasas_sat},#{@hidratos},#{@azucar},#{@proteina},#{@sal},#{@fibra})"
		end

		def <=>(other)
			return @grasas <=> other.grasas
			#return @grasas_sat <=> other.grasas_sat
			#return @hidratos <=> other.hidratos
			#return @azucar <=> other.azucar
			#return @proteina <=> other.proteina
			#return @sal <=> other.sal
		end	
		
		def val_ener
			return (9 * @grasas) + (4 * @hidratos) + (2 * @fibra) + (4 * @proteina) + (6 * @sal)
		end
	end

	class Lista
		include Enumerable

		attr_reader :tam, :head, :tail
	
		def initialize()
			@tam, @head, @tail = 0, nil, nil
		end
	

		def push(val)
			nodo= Node.new(val,nil,nil)
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

		def push_back(val)
			nodo = Node.new(val,nil,nil)
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
			if(@tam != 0)
				if(@tam == 1)
					@head = nil
					@tam = 0
				else
					@head.next.prev = nil
					@head = @head.next
					@tam = @tam - 1
				end
			end
		end
	
		def pop_back()
			if(@tam != 0) 
				if(@tam == 1)
					@tail = nil
					@tam = 0
				else
					@tail.prev.next = nil
					@tail = @tail.prev
					@tam = @tam - 1
				end 
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
		
		def inversion()
			lista2 = Lista.new()
			while @tam != 0
				lista2.push_back(@tail.value)
				self.pop_back()
			end
			while lista2.tam != 0
				self.push(lista2.tail.value)
				lista2.pop_back()
			end
		
		end

		def to_s()
        	        cadena = "{"
			aux = self.head
			while aux != nil
				cadena = cadena + aux.value.to_s
				if(aux.next != nil)
					cadena = cadena + ", "
				end
				aux = aux.next
			end
			cadena = cadena + "}"
			cadena
		end

		def each
			return nil unless @tam > 0
			aux = @head
			until aux.nil?
				yield aux.value
				aux = aux.next
			end
		end
	end

	class Menu
                attr_reader :lista
                def initialize
                        @lista = Lista.new()
                end

                def add_alimento(alimento)
                        @lista.push_back(alimento)
                end

                def to_s
                        @lista.to_s
                end

                def energia
			ener=0
                        @lista.collect{|entry| ener = ener + entry.val_ener}
                        return ener
                end

        end

module Valoracion_nut

	class Val_nut
		include Comparable
		attr_reader :peso, :talla, :edad, :sexo, :c_cintura, :c_cadera
	
		def initialize(peso, talla, edad, sexo, c_cintura, c_cadera)
			@peso, @talla, @edad, @sexo, @c_cintura, @c_cadera = peso, talla, edad, sexo, c_cintura, c_cadera
		end

		def to_s
			"(#{@peso}kg, #{@talla}m, #{@edad} años, #{@sexo}, #{@c_cintura}cm, #{@c_cadera}cm)"
		end
		
		def calcular_imc
			imc = @peso/(@talla*@talla)
		end

		def imc_descripcion
			imc = self.calcular_imc
			imc.round(3)
			if imc < 18.500
				"IMC: #{imc}; Clasificación de la OMS: Bajo peso; Descripción popular: Delgado"

			elsif imc < 25.000
				"IMC: #{imc}; Clasificación de la OMS: Adecuado; Descripción popular: Aceptable"

			elsif imc < 30.000
				"IMC: #{imc}; Clasificación de la OMS: Sobrepeso; Descripción popular: Sobrepeso"

			elsif imc < 35.000
				"IMC: #{imc}; Clasificación de la OMS: Obesidad grado 1; Descripción popular: Obesidad"

			elsif imc < 40.000
				"IMC: #{imc}; Clasificación de la OMS: Obesidad grado 2; Descripción popular: Obesidad"

			else
				"IMC: #{imc}; Clasificación de la OMS: Obesidad grado 3; Descripción popular: Obesidad"
			end
		end

		def calcular_grasa
			imc = self.calcular_imc
			if @sexo == "mujer"
				grasa = 1.2*imc+0.23*@edad-5.4
				grasa.round(3)
			else
				grasa = 1.2*(@peso/(@talla*@talla))+0.23*@edad-16.2
				grasa.round(3)
			end
		end

		def calcular_rcc
			rcc = @c_cintura/@c_cadera
			rcc.round(3)
		end

		def rcc_descripcion
			rcc = calcular_rcc

			if @sexo == "hombre"
				if rcc > 1.010
					"RCC: #{rcc}; Riesgo: Muy alto"
				elsif rcc > 0.950
					"RCC: #{rcc}; Riesgo: Alto"
				elsif rcc > 0.880
					"RCC: #{rcc}; Riesgo: Moderado"
				elsif rcc >= 0.830
					"RCC: #{rcc}; Riesgo: Bajo"
				else
					"No hay registro"
				end
			else
				if rcc > 0.82
					"RCC: #{rcc}; Riesgo: Alto"
				elsif rcc > 0.78
					"RCC: #{rcc}; Riesgo: Moderado"
				elsif rcc >= 0.72
					"RCC: #{rcc}; Riesgo: Bajo"
				else
					"No hay registro"
				end
			end
		end

		def <=>(other)
			imc=calcular_imc
			imc2=other.calcular_imc
			return imc <=> imc2
		end
	end

	class Individuo < Val_nut

        	attr_reader :paciente, :tratamiento

	        def initialize(paciente, peso, talla, edad, sexo, c_cintura, c_cadera)
        	        super(peso, talla, edad, sexo, c_cintura, c_cadera)
			@paciente = paciente
        	
                        imc = calcular_imc

                	imc.round(3)
	
        	        if imc < 35.000
	                        @tratamiento = 0
			else
				@tratamiento = 1
	                end
		end

	        def to_s
			if @paciente < 1
				pac = "No es paciente"
			else
				pac = "Es paciente"
			end

			if @tratamiento < 1
                        	trat = "No está en tratamiento"
	                else
        	                trat = "Está en tratamiento"
                	end


	                "(#{@peso}kg, #{@talla}m, #{@edad} años, #{@sexo}, #{@c_cintura}cm, #{@c_cadera}cm, #{pac}, #{trat})"
        	end
	end

	class Sujeto < Val_nut
		
		attr_reader :factor_a_f, :peso_t_i, :gasto_e_b, :efecto_t, :gasto_a_f, :gasto_e_t
 
 		def initialize(factor_af, peso, talla, edad, sexo, c_cintura, c_cadera)
                        super(peso, talla, edad, sexo, c_cintura, c_cadera)
			@factor_a_f = factor_af

			if factor_af == "Reposo"
				factor_a_f = 0.0
			elsif factor_af == "Actividad ligera"
				factor_a_f = 0.12
			elsif factor_af == "Actividad moderada"
				factor_a_f = 0.27
			elsif factor_af == "Actividad intensa"
				factor_a_f = 0.54
			else
				factor_a_f =0
			end

			@peso_t_i = (talla - 150) * 0.75 + 50
			if @sexo == "mujer"
				@gasto_e_b = (10 * peso) + (6.25 * talla) - (5 * edad) - 161
			else
				@gasto_e_b = (10 * peso) + (6.25 * talla) - (5 * edad) +5
			end
			
			@efecto_t = @gasto_e_b * 0.1
			@gasto_a_f = @gasto_e_b * factor_a_f
			@gasto_e_t = @gasto_e_b + @efecto_t + @gasto_a_f
				
		end

		def to_s
                        "(#{@peso}kg, #{@talla}m, #{@edad} años, #{@sexo}, #{@c_cintura}cm, #{@c_cadera}cm, #{@factor_a_f})"
                end

		def exigencia_c(cal_menu)
                        if (cal_menu - @gasto_e_t) < (@gasto_e_t * 0.1)
                                "La cantidad de la alimentación no es suficiente para cubrir las exigencias calóricas del organismo y no mantiene el equilibrio de su balance"
                        elsif (cal_menu - @gasto_e_t) > (@gasto_e_t *0.1)
                                "La cantidad de la alimentación es excesiva para cubrir las exigencias calóricas del organismo y no mantiene el equilibrio de su balance"
			else
				"La cantidad de la alimentación es suficiente para cubrir las exigencias calóricas del organismo y mantiene el equilibrio de su balance"
			end
                end

	end
end
