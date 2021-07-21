class Artist
  attr_reader :id, :name, :genre, :stage, :showtime
  @@artists = {}
  @@artist_id = 0

  def initialize(id, name, genre, stage, showtime)
    @id = id || @@artist_id += 1
    @name = name
    @genre = genre
    @stage = stage
    @showtime = showtime
  end

  def self.all
    @@artists.values()
  end

  def save
    @@artists[self.id] = Artist.new(self.id, self.name, self.genre, self.stage, self.showtime)
  end

  def self.clear
    @@artists = {}
    @@artist_id = 0
  end

  def ==(artist_to_compare)
    self.name() == artist_to_compare.name
  end

  def self.find(id)
    @@artists[id]
  end

  def update(name, genre, stage, showtime)
    @name = name
    @genre = genre
    @stage = stage
    @showtime = showtime
  end

  def self.find_stage(s_name)
    artists = []
    @@artists.values.each do |artist|
      if artist.stage == s_name
        artists.push(artist)
      end
    end
    artists
  end

  def delete
    @@artists.delete(self.id)
  end
end
