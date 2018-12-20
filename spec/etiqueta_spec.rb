RSpec.describe Etiqueta do

	before :each do
		@lista = Lista.new()
		@suj1 = Valoracion_nut::Individuo.new(0,80,2,20,"hombre",54.0,60.0)
		@suj2 = Valoracion_nut::Individuo.new(1,75,1.8,19,"hombre",70.0,75.0)
		@suj3 = Valoracion_nut::Individuo.new(1,140,1.56,17,"mujer",90.0,100.0)
		@suj4 = Valoracion_nut::Individuo.new(1,130,1.7,30,"hombre",86.0,90.0)
		@suj5 = Valoracion_nut::Individuo.new(0,30,1.5,10,"mujer",34.0,40.0)
		
		@menu = Menu.new()
		@menu1 = Menu.new()
                @menu2 = Menu.new()
                @menu3 = Menu.new()
                @menu4 = Menu.new()
                @menu5 = Menu.new()
                @menu6 = Menu.new()
                @menu7 = Menu.new()
                @menu8 = Menu.new()
                @menu9 = Menu.new()
                @menu10 = Menu.new()
		@alimento1 = Etiqueta_nut.new("Tortilla",29.2,8.3,1.6,0.8,26.4,0.4,6)
		@alimento2 = Etiqueta_nut.new("Galletas saladas",6.2,1.4,52,1.6,6.7,0.7,3.2)
		@alimento3 = Etiqueta_nut.new("Pan",0.9,0.2,13.7,1.4,2.6,0.1,3.5)
		@alimento4 = Etiqueta_nut.new("Galletas con chocolate",2.8,1.2,7.8,4.3,0.6,0.2,3.3)
		@alimento5 = Etiqueta_nut.new("Bollo",16.5,4.4,45,2.2,7.1,0.6,2.3)
		@alimento6 = Etiqueta_nut.new("Yogur",0.3,0.1,8,7.9,5.5,0.2,2.2)
		@alimento7 = Etiqueta_nut.new("Queso",28.13,18.92,1.99,0.23,20.98,3,0)
		@alimento8 = Etiqueta_nut.new("Cereales",0.9,0.2,84,8,7,1.13,7)
		@alimento9 = Etiqueta_nut.new("Palomitas",15.8,7,44,1,9.4,2,17.5)
		@alimento10 = Etiqueta_nut.new("Hamburguesa",4.24,0.336,26.43,1.74,11.63,0.295,11.7)
                @lista_menu = Lista.new()
                @sujeto1 = Valoracion_nut::Sujeto.new("Actividad intensa",80,2,20,"hombre",54.0,60.0)
                @sujeto2 = Valoracion_nut::Sujeto.new("Actividad moderada",75,1.8,19,"hombre",70.0,75.0)
                @sujeto3 = Valoracion_nut::Sujeto.new("Reposo",140,1.56,17,"mujer",90.0,100.0)
                @sujeto4 = Valoracion_nut::Sujeto.new("Actividad ligera",130,1.7,30,"hombre",86.0,90.0)
                @sujeto5 = Valoracion_nut::Sujeto.new("Actividad ligera",30,1.5,10,"mujer",34.0,40.0)	
		@sujeto6 = Valoracion_nut::Sujeto.new("Actividad intensa",73,1.76,24,"mujer",53.0,59.0)
                @sujeto7 = Valoracion_nut::Sujeto.new("Actividad moderada",87,1.93,34,"hombre",74.0,78.0)
                @sujeto8 = Valoracion_nut::Sujeto.new("Reposo",57,1.6,46,"hombre",40.0,50.0)
                @sujeto9 = Valoracion_nut::Sujeto.new("Actividad ligera",48,1.59,50,"mujer",40.0,47.0)
                @sujeto10 = Valoracion_nut::Sujeto.new("Actividad ligera",60,1.65,43,"mujer",48.0,54.0)
		@menu1.add_alimento(@alimento1)                       
	       	@menu1.add_alimento(@alimento7)               
       		@menu1.add_alimento(@alimento6)
		@menu2.add_alimento(@alimento2)
		@menu2.add_alimento(@alimento9)
		@menu2.add_alimento(@alimento5)
		@menu3.add_alimento(@alimento10)
		@menu3.add_alimento(@alimento6)
		@menu3.add_alimento(@alimento4)
		@menu4.add_alimento(@alimento3)
		@menu4.add_alimento(@alimento7)
                @menu4.add_alimento(@alimento1)
		@menu5.add_alimento(@alimento8)
                @menu5.add_alimento(@alimento6)
                @menu5.add_alimento(@alimento5)
                @menu6.add_alimento(@alimento8)
                @menu6.add_alimento(@alimento6)
                @menu6.add_alimento(@alimento4)
                @menu7.add_alimento(@alimento4)
                @menu7.add_alimento(@alimento2)
                @menu7.add_alimento(@alimento5)
		@menu8.add_alimento(@alimento10)
                @menu8.add_alimento(@alimento8)
                @menu8.add_alimento(@alimento9)
                @menu9.add_alimento(@alimento1)
                @menu9.add_alimento(@alimento4) 
		@menu9.add_alimento(@alimento5)
                @menu10.add_alimento(@alimento4)
                @menu10.add_alimento(@alimento5)
                @menu10.add_alimento(@alimento6)



	end
	

  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  describe Etiqueta_nut do
  
    describe "#inicializar" do
	    it "Se inicializa el objeto" do
		    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56,8)
	    end

	    it "Se inicializa la lista" do
		    @lista = Lista.new()
	    end

	    it "Se inicializa un nodo" do
		    @nodo = Node.new("etiqueta",nil,nil)
	    end
    end

    describe "#obtener atributos" do
	    it "Obtener nomnbre (Nombre)" do
		    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56,8)
		    expect(@etq.name).to eq("Nombre")
	    end
	    
	    it "Obtener grasas (64)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56,8)
                    expect(@etq.grasas).to eq(64)
            end

	    it "Obtener grasas saturadas (grasas_sat)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56,8)
                    expect(@etq.grasas_sat).to eq(34)
            end

            it "Obtener hidratos de carbono (70)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56,8)
                    expect(@etq.hidratos).to eq(70)
            end

            it "Obtener azúcares (22)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56,8)
                    expect(@etq.azucar).to eq(22)
            end

            it "Obtener proteínas (42)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56,8)
                    expect(@etq.proteina).to eq(42)
            end

            it "Obtener sal (56)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56,8)
                    expect(@etq.sal).to eq(56)
            end

            it "Obtener lista de atributos" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56,8)
                    expect(@etq.to_s).to eq("(\"Nombre\",64,34,70,22,42,56,8)")
            end

    end

    describe "#Comparar la información entre dos etiquetas" do

	it "Es mayor" do
		expect(@alimento1 > @alimento2).to eq(true)
	end
 
        it "Es menor" do
                expect(@alimento2 < @alimento1).to eq(true)
        end

 
        it "Es mayor o igual" do
                expect(@alimento1 >= @alimento2).to eq(true)
		expect(@alimento1 >= @alimento1).to eq(true)
        end

 
        it "Es menor o igual" do
                expect(@alimento2 <= @alimento1).to eq(true)
		expect(@alimento1 <= @alimento1).to eq(true)
        end

 
        it "Es igual" do
                expect(@alimento1 == @alimento1).to eq(true)
        end

 
        it "No es igual" do
                expect(@alimento1 != @alimento2).to eq(true)
        end
    end

  end
    describe Lista do
	    it "Insertar nodo a la lista" do
		    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56,8)
		    @list = Lista.new()
		    @list.push(@etq)
	    end

	    it "Insertar nodo atrás" do
		    @lista.push_back(@alimento3)
	    end

	    it "Insertar nodos y comprobar tamaño" do
		    @lista.push(@alimento2)
		    @lista.push(@alimento1)
		    @lista.push_back(@alimento3)
		    @lista.push_back(@alimento4)
		    @lista.push_back(@alimento5)
		    expect(@lista.tam).to eq(5)
	    end

	    it "Eliminar nodo head" do 
		    @lista.push(@alimento1)
		    @lista.push_back(@alimento5)
		    @lista.pop_front()
	    end

	    it "Eliminar nodo tail" do
		    @lista.push(@alimento1)
		    @lista.push_back(@alimento5)
		    @lista.pop_back()
	    end

	    it "Ordenar lista por cantidad de sal" do
                    @lista.push(@alimento1)
                    @lista.push(@alimento2)
                    @lista.push(@alimento3)
                    @lista.push(@alimento4)
                    @lista.push(@alimento5)

		    @lista.order_by_salt()
	    end

	    it "Comprobar orden" do
		    @lista.push(@alimento1)
                    @lista.push(@alimento2)
                    @lista.push(@alimento3)
                    @lista.push(@alimento4)
                    @lista.push(@alimento5)
                    @lista.order_by_salt()
                    expect(@lista.head.value.sal).to eq(0.1)
		    expect(@lista.head.next.value.sal).to eq(0.2)
		    expect(@lista.head.next.next.value.sal).to eq(0.4)
		    expect(@lista.tail.prev.value.sal).to eq(0.6)
		    expect(@lista.tail.value.sal).to eq(0.7)
	    end

	    it "comprobar el funcionamiento de to_s" do
                    @lista.push_back(@alimento1)
                    @lista.push_back(@alimento2)
                    @lista.push_back(@alimento3)
                    @lista.push_back(@alimento4)
                    @lista.push_back(@alimento5)

		    expect(@lista.to_s()).to eq("{(\"Tortilla\",29.2,8.3,1.6,0.8,26.4,0.4,6), (\"Galletas saladas\",6.2,1.4,52,1.6,6.7,0.7,3.2), (\"Pan\",0.9,0.2,13.7,1.4,2.6,0.1,3.5), (\"Galletas con chocolate\",2.8,1.2,7.8,4.3,0.6,0.2,3.3), (\"Bollo\",16.5,4.4,45,2.2,7.1,0.6,2.3)}")
    	    end

            it "Comprobar orden inverso" do
                    @lista.push_back(@alimento1)
                    @lista.push_back(@alimento2)
                    @lista.push_back(@alimento3)
                    @lista.push_back(@alimento4)
                    @lista.push_back(@alimento5)
		    @lista.inversion()
                    expect(@lista.head.value.name).to eq("Bollo")
                    expect(@lista.head.next.value.name).to eq("Galletas con chocolate")
                    expect(@lista.head.next.next.value.name).to eq("Pan")
		    expect(@lista.tail.prev.value.name).to eq("Galletas saladas")
                    expect(@lista.tail.value.name).to eq("Tortilla")
            end

	    describe "Enumerar etiquetas" do
		    it "Máximo" do
                            @lista.push_back(@alimento1)
                            @lista.push_back(@alimento2)
                            @lista.push_back(@alimento3)
                            @lista.push_back(@alimento4)
                            @lista.push_back(@alimento5)
			    expect(@lista.max).to eq(@alimento1)
		    end

		    it "Mínimo" do
                            @lista.push_back(@alimento1)
                            @lista.push_back(@alimento2)
                            @lista.push_back(@alimento3)
                            @lista.push_back(@alimento4)
                            @lista.push_back(@alimento5)
                            expect(@lista.min).to eq(@alimento3)
                    end

                    it "Sort" do
                            @lista.push_back(@alimento1)
                            @lista.push_back(@alimento2)
                            @lista.push_back(@alimento3)
                            @lista.push_back(@alimento4)
                            @lista.push_back(@alimento5)
                            expect(@lista.sort).to eq([@alimento3,@alimento4,@alimento2,@alimento5,@alimento1])
                    end

                    it "Collect" do
                            @lista.push_back(@alimento1)
                            @lista.push_back(@alimento2)
                            @lista.push_back(@alimento3)
                            @lista.push_back(@alimento4)
                            @lista.push_back(@alimento5)
                            expect(@lista.map{|i| i}).to eq([@alimento1,@alimento2,@alimento3,@alimento4,@alimento5])
			    expect(@lista.collect{|i| i}).to eq([@alimento1,@alimento2,@alimento3,@alimento4,@alimento5])
                    end

                    it "Select" do
                            @lista.push_back(@alimento1)
                            @lista.push_back(@alimento2)
                            @lista.push_back(@alimento3)
                            @lista.push_back(@alimento4)
                            @lista.push_back(@alimento5)
                            expect(@lista.select{|i| i}).to eq([@alimento1,@alimento2,@alimento3,@alimento4,@alimento5])
                    end
	    end

	    describe "Enumerar individuos" do
                    it "Máximo" do
                            @lista.push_back(@suj1)
                            @lista.push_back(@suj2)
                            @lista.push_back(@suj3)
                            @lista.push_back(@suj4)
                            @lista.push_back(@suj5)
                            expect(@lista.max).to eq(@suj3)
                    end

                    it "Mínimo" do
                            @lista.push_back(@suj1)
                            @lista.push_back(@suj2)
                            @lista.push_back(@suj3)
                            @lista.push_back(@suj4)
                            @lista.push_back(@suj5)
                            expect(@lista.min).to eq(@suj5)
                    end

                    it "Sort" do
                            @lista.push_back(@suj1)
                            @lista.push_back(@suj2)
                            @lista.push_back(@suj3)
                            @lista.push_back(@suj4)
                            @lista.push_back(@suj5)
			    expect(@lista.sort).to eq([@suj5,@suj1,@suj2,@suj4,@suj3])
                    end

                    it "Collect" do
                            @lista.push_back(@suj1)
                            @lista.push_back(@suj2)
                            @lista.push_back(@suj3)
                            @lista.push_back(@suj4)
                            @lista.push_back(@suj5)
                            expect(@lista.map{|i| i}).to eq([@suj1,@suj2,@suj3,@suj4,@suj5])
                            expect(@lista.collect{|i| i}).to eq([@suj1,@suj2,@suj3,@suj4,@suj5])
                    end

                    it "Select" do
                            @lista.push_back(@suj1)
                            @lista.push_back(@suj2)
                            @lista.push_back(@suj3)
                            @lista.push_back(@suj4)
                            @lista.push_back(@suj5)
                            expect(@lista.select{|i| i}).to eq([@suj1,@suj2,@suj3,@suj4,@suj5])
                    end
            end
	
    end

    describe Valoracion_nut::Individuo do
	
	it "Crear individuos" do
		@sujeto = Valoracion_nut::Individuo.new(0,80,2,20,"hombre",54.0,60.0)
	end

	it "Comprobar to_s" do
		@sujeto = Valoracion_nut::Individuo.new(0,80,2,20,"hombre",54.0,60.0)
		expect(@sujeto.to_s).to eq("(80kg, 2m, 20 años, hombre, 54.0cm, 60.0cm, No es paciente, No está en tratamiento)")
    
	end
    	describe "#Comparar la información entre dos etiquetas" do

        	it "Es mayor" do
                	expect(@suj2 > @suj1).to eq(true)
	        end

	        it "Es menor" do
	                expect(@suj1 < @suj2).to eq(true)
	        end


        	it "Es mayor o igual" do
	                expect(@suj2 >= @suj1).to eq(true)
        	        expect(@suj1 >= @suj1).to eq(true)
	        end

	        it "Es menor o igual" do
	                expect(@suj1 <= @suj2).to eq(true)
        	        expect(@suj1 <= @suj1).to eq(true)
	        end

	        it "Es igual" do
        	        expect(@suj1 == @suj1).to eq(true)
	        end

	        it "No es igual" do
        	        expect(@suj1 != @suj2).to eq(true)
	      	end
	end

	it "Comprobar clase" do
		expect(@suj1.class).to eq(Valoracion_nut::Individuo)
		expect(@suj1.instance_of? Valoracion_nut::Individuo).to eq(true)
                expect(@suj1.is_a? Valoracion_nut::Individuo).to eq(true)
        	expect(@suj1.is_a? Object).to eq(true)
		expect(@suj1.kind_of? Valoracion_nut::Individuo).to eq(true)
        end

	it "Comprobar tipo" do
		expect(@suj1.respond_to?:paciente).to eq(true)
	end

	it "Comprobar jerarquía" do
		expect(@suj1.class.superclass).to eq(Valoracion_nut::Val_nut)
		expect(@suj1.class.superclass.superclass).to eq(Object)
		expect(@suj1.class.superclass.superclass.superclass).to eq(BasicObject)
		expect(@suj1.class.superclass.superclass.superclass.superclass).to eq(nil)
	end

	it "Comprobar ordenación lista de valoraciones nutricionales por índice de masa corporal" do
		@lista.push_back(@suj1)
		@lista.push_back(@suj2)
		@lista.push_back(@suj3)
		@lista.push_back(@suj4)
		@lista.push_back(@suj5)

		aux = @lista.head
        	while aux.next != nil
                	aux2 = aux.next
                        while aux2 != nil
                        	if(aux.value.calcular_imc > aux2.value.calcular_imc)
                                	max = aux2.value
                                        aux2.value = aux.value
                                        aux.value = max

                               	end
                                aux2 = aux2.next
             		end
                        aux = aux.next
             	end
                
		aux = @lista.head
                aux2 = @lista.head.next

		while aux2 != nil
			expect(aux.value.calcular_imc < aux2.value.calcular_imc).to eq(true)
			aux2 = aux2.next
			aux = aux.next
		end
	end



    end


   	describe Valoracion_nut::Sujeto do

		it "to_s" do
			expect(@sujeto1.to_s).to eq("(80kg, 2m, 20 años, hombre, 54.0cm, 60.0cm, Actividad intensa)")
		end
		
		it "exigencias calóricas" do
                        @menu.add_alimento(@alimento1)
			@menu.add_alimento(@alimento2)
			@menu.add_alimento(@alimento3)
			@menu.add_alimento(@alimento4)
                        @menu.add_alimento(@alimento5)
			expect(@sujeto1.exigencia_c(@menu.energia)).to eq("La cantidad de la alimentación no es suficiente para cubrir las exigencias calóricas del organismo y no mantiene el equilibrio de su balance")
			expect(@sujeto2.exigencia_c(@menu.energia)).to eq("La cantidad de la alimentación es excesiva para cubrir las exigencias calóricas del organismo y no mantiene el equilibrio de su balance")
			expect(@sujeto3.exigencia_c(@menu.energia)).to eq("La cantidad de la alimentación no es suficiente para cubrir las exigencias calóricas del organismo y no mantiene el equilibrio de su balance")
			expect(@sujeto4.exigencia_c(@menu.energia)).to eq("La cantidad de la alimentación no es suficiente para cubrir las exigencias calóricas del organismo y no mantiene el equilibrio de su balance")
			expect(@sujeto5.exigencia_c(@menu.energia)).to eq("La cantidad de la alimentación es excesiva para cubrir las exigencias calóricas del organismo y no mantiene el equilibrio de su balance")

		end
	end

	describe "Programación funcional" do
		
		it "array de menús" do
			@array_m = []
                        @array_m << @menu1
                        @array_m << @menu2
                        @array_m << @menu3
                        @array_m << @menu4
                        @array_m << @menu5
                        @array_m << @menu6
                        @array_m << @menu7
                        @array_m << @menu8
                        @array_m << @menu9
                        @array_m << @menu10
		end

		it "lista de sujetos" do
			@lista_s = Lista.new()
	                @lista_s.push_back(@sujeto1)
	                @lista_s.push_back(@sujeto2)
	                @lista_s.push_back(@sujeto3)
	                @lista_s.push_back(@sujeto4)
                	@lista_s.push_back(@sujeto5)            
		   	@lista_s.push_back(@sujeto6)
                        @lista_s.push_back(@sujeto7)
                        @lista_s.push_back(@sujeto8)
                        @lista_s.push_back(@sujeto9)
                        @lista_s.push_back(@sujeto10)
		end

		
	end

	



end
