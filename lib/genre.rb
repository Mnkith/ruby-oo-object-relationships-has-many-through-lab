class Genre
  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name 
    @@all << self
  end

  def self.all 
    @@all
  end

  def songs
    Song.all.reject{|song| song.genre != self}
  end

  def artists
    Song.all.map{|song|  song.artist if song.genre == self}.compact
  end


end