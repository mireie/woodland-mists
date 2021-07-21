require "rspec"
require "pry"
require "artist"
require "stage"

describe ("#artist") do
  before(:each) do
    Artist.clear()
  end

  describe (".all") do
    it("saves an artist to the artist construct") do
      artist1 = Artist.new(nil, "Manilow and the Berries", "Wizard Funktronic", nil, "6 AM")
      artist1.save
      expect(Artist.all).to(eq([artist1]))
    end
  end

  describe (".clear") do
    it("clears the Artist class values") do
      artist1 = Artist.new(nil, "Manilow and the Berries", "Wizard Funktronic", nil, "6 AM")
      artist1.save
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe (".find") do
    it("finds an artist by id") do
      artist1 = Artist.new(nil, "Manilow and the Berries", "Wizard Funktronic", nil, "6 AM")
      artist1.save
      artist2 = Artist.new(nil, "Frank and the Furters", "Sausage Rock", nil, "6:01 AM")
      artist2.save
      expect(Artist.find(artist1.id)).to(eq(artist1))
    end
  end

  describe("#update") do
    it("updates an artist by id") do
      artist1 = Artist.new(nil, "Manilow and the Berries", "Wizard Funktronic", nil, "6 AM")
      artist1.save()
      artist1.update("Frank and the Furters", "Polish Sausage Rock", nil, "6:01 AM")
      expect(artist1.name).to(eq("Frank and the Furters"))
    end
  end

  describe("#delete") do
    it("deletes an artist by id") do
      artist = Artist.new(nil, "Manilow and the Berries", "Wizard Funktronic", nil, "6 AM")
      artist.save()
      artist2 = Artist.new(nil, "Frank and the Furters", "Sausage Rock", nil, "6:01 AM")
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe(".find_stage") do
    it("tells you who is on a stage") do
      stage1 = Stage.new(nil, "Waterfall Arena", "Near the desert", 500)
      artist = Artist.new(nil, "Manilow and the Berries", "Wizard Funktronic", stage1.name, "6 AM")
      artist.save()
      artist2 = Artist.new(nil, "Frank and the Furters", "Sausage Rock", "Bobby's House", "6:01 AM")
      artist2.save()
      expect(Artist.find_stage(stage1.name)).to(eq([artist]))
    end
  end
end
