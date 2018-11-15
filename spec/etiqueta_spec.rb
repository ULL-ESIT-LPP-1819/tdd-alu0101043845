RSpec.describe Etiqueta do
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

    end

  end
end
