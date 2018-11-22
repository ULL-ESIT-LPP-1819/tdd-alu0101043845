RSpec.describe Etiqueta do

	before :each do
		@etq1 = Valoracion_nut::Etiqueta_nut.new("Tortilla",29.2,8.3,1.6,0.8,26.4,0.4)
		@etq2 = Valoracion_nut::Etiqueta_nut.new("Galletas saladas",6.2,1.4,52,1.6,6.7,0.7)
		@etq3 = Valoracion_nut::Etiqueta_nut.new("Pan",0.9,0.2,13.7,1.4,2.6,0.1)
		@etq4 = Valoracion_nut::Etiqueta_nut.new("Galletas con chocolate",2.8,1.2,7.8,4.3,0.6,0.2)
		@etq5 = Valoracion_nut::Etiqueta_nut.new("Bollo",16.5,4.4,45,2.2,7.1,0.6)
		@lista = Valoracion_nut::Lista.new()
	end
	

  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  describe Valoracion_nut::Etiqueta_nut do
  
    describe "#inicializar" do
	    it "Se inicializa el objeto" do
		    @etq = Valoracion_nut::Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
	    end

	    it "Se inicializa la lista" do
		    @lista = Valoracion_nut::Lista.new()
	    end

	    it "Se inicializa un nodo" do
		    @nodo = Node.new("etiqueta",nil,nil)
	    end
    end

    describe "#obtener atributos" do
	    it "Obtener nomnbre (Nombre)" do
		    @etq = Valoracion_nut::Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
		    expect(@etq.name).to eq("Nombre")
	    end
	    
	    it "Obtener grasas (64)" do
                    @etq = Valoracion_nut::Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.grasas).to eq(64)
            end

	    it "Obtener grasas saturadas (grasas_sat)" do
                    @etq = Valoracion_nut::Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.grasas_sat).to eq(34)
            end

            it "Obtener hidratos de carbono (70)" do
                    @etq = Valoracion_nut::Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.hidratos).to eq(70)
            end

            it "Obtener azúcares (22)" do
                    @etq = Valoracion_nut::Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.azucar).to eq(22)
            end

            it "Obtener proteínas (42)" do
                    @etq = Valoracion_nut::Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.proteina).to eq(42)
            end

            it "Obtener sal (56)" do
                    @etq = Valoracion_nut::Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.sal).to eq(56)
            end

            it "Obtener lista de atributos" do
                    @etq = Valoracion_nut::Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
                    expect(@etq.to_s).to eq("(\"Nombre\",64,34,70,22,42,56)")
            end

    end
  end
    describe Valoracion_nut::Lista do
	    it "Insertar nodo a la lista" do
		    @etq = Valoracion_nut::Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
		    @list = Valoracion_nut::Lista.new()
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
    end

end
