require "rspec"
require "pry"
require "artist"
require "stage"

describe ("#artist") do
  describe (".all") do
    it("saves an artist to the artist construct") do
      artist1 = Artist.new(nil, "Manilow and the Berries", "Wizard Funktronic", nil, "6 AM")
      artist1.save
      expect(Artist.all).to(eq([artist1]))
    end
  end
end