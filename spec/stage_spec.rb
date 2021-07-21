require "rspec"
require "pry"
require "artist"
require "stage"

describe ("#stage") do
  before(:each) do
    Stage.clear()
  end

  describe (".all") do
    it("saves an stage to the stage construct") do
      stage1 = Stage.new(nil, "Manilow and the Berries", "Wizard Funktronic", 500)
      stage1.save
      expect(Stage.all).to(eq([stage1]))
    end
  end

  describe (".clear") do
    it("clears the Stage class values") do
      stage1 = Stage.new(nil, "Manilow and the Berries", "Wizard Funktronic", 500)
      stage1.save
      Stage.clear
      expect(Stage.all).to(eq([]))
    end
  end

  describe (".find") do
    it("finds an stage by id") do
      stage1 = Stage.new(nil, "Manilow and the Berries", "Wizard Funktronic", 500)
      stage1.save
      stage2 = Stage.new(nil, "Frank and the Furters", "Sausage Rock", 30)
      stage2.save
      expect(Stage.find(stage1.id)).to(eq(stage1))
    end
  end

  describe("#update") do
    it("updates an stage by id") do
      stage1 = Stage.new(nil, "Manilow and the Berries", "Wizard Funktronic", 500)
      stage1.save()
      stage1.update("Frank and the Furters", "Polish Sausage Rock", 30)
      expect(stage1.name).to(eq("Frank and the Furters"))
    end
  end

  describe("#delete") do
    it("deletes an stage by id") do
      stage = Stage.new(nil, "Manilow and the Berries", "Wizard Funktronic", 500)
      stage.save()
      stage2 = Stage.new(nil, "Frank and the Furters", "Sausage Rock", 30)
      stage2.save()
      stage.delete()
      expect(Stage.all).to(eq([stage2]))
    end
  end
end
