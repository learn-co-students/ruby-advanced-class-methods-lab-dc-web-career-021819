require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    new_song = Song.create
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_by_name(name)
  end

  def self.create
    new_song = Song.new
    self.all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      song = self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name[0]}
  end

  def self.new_from_filename(file_name)
    #separates artist name and song title
    song_array = file_name.split(" - ")
    # creates a new song
    new_song = Song.create
    new_song.artist_name = song_array[0]
    #removes file extension and adds song name
    new_song.name = song_array[1][0...-4]
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def self.destroy_all
    self.all.clear
  end

end
# binding.pry
#
