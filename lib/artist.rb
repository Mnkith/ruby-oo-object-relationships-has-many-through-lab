require_relative 'genre.rb'
require_relative 'song.rb'
class Artist
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
    Song.all.reject{|song| song.artist != self }
  end

  def new_song(song_name, genre)
    Song.new(song_name, self, genre)
  end

  def genres
    Song.all.map{|song|  song.genre if song.artist == self}.compact
  end
end
jay_z = Artist.new("Jay-Z")
rapp = Genre.new("rapp")
song1 = jay_z.new_song("1", rapp)

rappz = Genre.new("rappz")
song2 = jay_z.new_song("2", rappz)

rapxxz = Genre.new("rapxxz")
song3 = jay_z.new_song("3", rapxxz)

rapddz = Genre.new("rapddz")
song4 = jay_z.new_song("4", rapddz)

jay_x = Artist.new("Jay-x")
rappx = Genre.new("rappx")
song5 = jay_x.new_song("5", rappx)

rapddx = Genre.new("rapddx")
song6 = jay_x.new_song("6", rapddx)

jay_y = Artist.new("Jay-y")
rapddy = Genre.new("rapdd")
song7 = jay_y.new_song("7", rapddy)

rapy = Genre.new("rapp")
song8 = jay_y.new_song("8", rapy)

p jay_z.genres