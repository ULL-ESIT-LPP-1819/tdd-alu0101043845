RSpec.describe Etiqueta do
	before :each do
		@etq1 = Etiqueta_nut.new("Tortilla",29.2,8.3,1.6,0.8,26.4,0.4)
		@etq2 = Etiqueta_nut.new("Galletas saladas",6.2,1.4,52,1.6,6.7,0.7)
		@etq3 = Etiqueta_nut.new("Pan",0.9,0.2,13.7,1.4,2.6,0.1)
		@etq4 = Etiqueta_nut.new("Galletas con chocolate",2.8,1.2,7.8,4.3,0.6,0.2)
		@etq5 = Etiqueta_nut.new("Bollo",16.5,4.4,45,2.2,7.1,0.6)

		@nodo1 = Node.new(@etq1,nil,nil)
		@nodo2 = Node.new(@etq2,nil,nil)
		@nodo3 = Node.new(@etq3,nil,nil)
		@nodo4 = Node.new(@etq4,nil,nil)
		@nodo5 = Node.new(@etq5,nil,nil)
		@lista = Lista.new()
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

    describe "#Uso de la lista" do
	    it "Insertar nodo a la lista" do
		    @etq = Etiqueta_nut.new("Nombre",64,34,70,22,42,56)
		    @nodo = Node.new(@etq,nil,nil)
		    @list = Lista.new()
		    @list.push(@nodo)
	    end

	    it "Insertar nodo atrás" do
		    @lista.push_back(@nodo3)
	    end

	    it "Insertar nodos y comprobar tamaño" do
		    @lista.push(@nodo2)
		    @lista.push(@nodo1)
		    @lista.push_back(@nodo3)
		    @lista.push_back(@nodo4)
		    @lista.push_back(@nodo5)
		    expect(@lista.tam).to eq(5)
	    end

	    it "Eliminar nodo head" do 
		    @lista.push(@nodo1)
		    @lista.push_back(@nodo5)
		    @lista.pop_front()
	    end

	    it "Eliminar nodo tail" do
		    @lista.push(@nodo1)
		    @lista.push_back(@nodo5)
		    @lista.pop_back()
	    end

	    it "Ordenar lista por cantidad de sal" do
                    @lista.push(@nodo1)
                    @lista.push(@nodo2)
		    @lista.push(@nodo3)
		    @lista.push(@nodo4)
		    @lista.push(@nodo5)
		    @lista.order_by_salt()
	    end

	    it "Comprobar orden" do
		    @lista.push(@nodo1)
                    @lista.push(@nodo2)
                    @lista.push(@nodo3)
                    @lista.push(@nodo4)
                    @lista.push(@nodo5)
                    @lista.order_by_salt()
                    expect(@lista.head.value.sal).to eq(0.1)
		    expect(@lista.head.next.value.sal).to eq(0.2)
		    expect(@lista.head.next.next.value.sal).to eq(0.4)
		    expect(@lista.tail.prev.value.sal).to eq(0.6)
		    expect(@lista.tail.value.sal).to eq(0.7)
	    end

            it "Comprobar orden inverso" do
                    @lista.push(@nodo1)
                    @lista.push(@nodo2)
                    @lista.push(@nodo3)
                    @lista.push(@nodo4)
                    @lista.push(@nodo5)
                    @lista.order_by_salt()
		    @lista.inversion()
                    expect(@lista.head.value.sal).to eq(0.7)
                    expect(@lista.head.next.value.sal).to eq(0.6)
                    expect(@lista.head.next.next.value.sal).to eq(0.4)
                    expect(@lista.tail.prev.value.sal).to eq(0.2)
                    expect(@lista.tail.value.sal).to eq(0.1)
            end
    end

  end
end
