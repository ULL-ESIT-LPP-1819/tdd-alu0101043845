RSpec.describe Etiqueta do

	before :each do
		@etq1 = Etiqueta_nut.new("Tortilla",29.2,8.3,1.6,0.8,26.4,0.4)
		@etq2 = Etiqueta_nut.new("Galletas saladas",6.2,1.4,52,1.6,6.7,0.7)
		@etq3 = Etiqueta_nut.new("Pan",0.9,0.2,13.7,1.4,2.6,0.1)
		@etq4 = Etiqueta_nut.new("Galletas con chocolate",2.8,1.2,7.8,4.3,0.6,0.2)
		@etq5 = Etiqueta_nut.new("Bollo",16.5,4.4,45,2.2,7.1,0.6)
		@lista = Lista.new()
		@suj1 = Valoracion_nut::Individuo.new(0,80,2,20,"hombre",54.0,60.0)
		@suj2 = Valoracion_nut::Individuo.new(1,75,1.8,19,"hombre",70.0,75.0)
		@suj3 = Valoracion_nut::Individuo.new(1,140,1.56,17,"mujer",90.0,100.0)
		@suj4 = Valoracion_nut::Individuo.new(1,130,1.7,30,"hombre",86.0,90.0)
		@suj5 = Valoracion_nut::Individuo.new(0,30,1.5,10,"mujer",34.0,40.0)
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
		    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
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
		    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
		    expect(@etq.name).to eq("Nombre")
	    end
	    
	    it "Obtener grasas (64)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.grasas).to eq(64)
            end

	    it "Obtener grasas saturadas (grasas_sat)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.grasas_sat).to eq(34)
            end

            it "Obtener hidratos de carbono (70)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.hidratos).to eq(70)
            end

            it "Obtener azúcares (22)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.azucar).to eq(22)
            end

            it "Obtener proteínas (42)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.proteina).to eq(42)
            end

            it "Obtener sal (56)" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.sal).to eq(56)
            end

            it "Obtener lista de atributos" do
                    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.to_s).to eq("(\"Nombre\",64,34,70,22,42,56)")
            end

    end
  end
    describe Lista do
	    it "Insertar nodo a la lista" do
		    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
		    @list = Lista.new()
		    @list.push(@etq)
	    end

	    it "Insertar nodo atrás" do
		    @lista.push_back(@etq3)
	    end

	    it "Insertar nodos y comprobar tamaño" do
		    @lista.push(@etq2)
		    @lista.push(@etq1)
		    @lista.push_back(@etq3)
		    @lista.push_back(@etq4)
		    @lista.push_back(@etq5)
		    expect(@lista.tam).to eq(5)
	    end

	    it "Eliminar nodo head" do 
		    @lista.push(@etq1)
		    @lista.push_back(@etq5)
		    @lista.pop_front()
	    end

	    it "Eliminar nodo tail" do
		    @lista.push(@etq1)
		    @lista.push_back(@etq5)
		    @lista.pop_back()
	    end

	    it "Ordenar lista por cantidad de sal" do
                    @lista.push(@etq1)
                    @lista.push(@etq2)
		    @lista.push(@etq3)
		    @lista.push(@etq4)
		    @lista.push(@etq5)
		    @lista.order_by_salt()
	    end

	    it "Comprobar orden" do
		    @lista.push(@etq1)
                    @lista.push(@etq2)
                    @lista.push(@etq3)
                    @lista.push(@etq4)
                    @lista.push(@etq5)
                    @lista.order_by_salt()
                    expect(@lista.head.value.sal).to eq(0.1)
		    expect(@lista.head.next.value.sal).to eq(0.2)
		    expect(@lista.head.next.next.value.sal).to eq(0.4)
		    expect(@lista.tail.prev.value.sal).to eq(0.6)
		    expect(@lista.tail.value.sal).to eq(0.7)
	    end

	    it "comprobar el funcionamiento de to_s" do
	 	    @lista.push_back(@etq1)
                    @lista.push_back(@etq2)
                    @lista.push_back(@etq3)
                    @lista.push_back(@etq4)
                    @lista.push_back(@etq5)
		    expect(@lista.to_s()).to eq("{(\"Tortilla\",29.2,8.3,1.6,0.8,26.4,0.4), (\"Galletas saladas\",6.2,1.4,52,1.6,6.7,0.7), (\"Pan\",0.9,0.2,13.7,1.4,2.6,0.1), (\"Galletas con chocolate\",2.8,1.2,7.8,4.3,0.6,0.2), (\"Bollo\",16.5,4.4,45,2.2,7.1,0.6)}")
    	    end

            it "Comprobar orden inverso" do
                    @lista.push_back(@etq1)
                    @lista.push_back(@etq2)
                    @lista.push_back(@etq3)
                    @lista.push_back(@etq4)
                    @lista.push_back(@etq5)
		    @lista.inversion()
                    expect(@lista.head.value.name).to eq("Bollo")
                    expect(@lista.head.next.value.name).to eq("Galletas con chocolate")
                    expect(@lista.head.next.next.value.name).to eq("Pan")
		    expect(@lista.tail.prev.value.name).to eq("Galletas saladas")
                    expect(@lista.tail.value.name).to eq("Tortilla")
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






end
