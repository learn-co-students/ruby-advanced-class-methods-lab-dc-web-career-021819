require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.save(song)
    self.all << song
  end

  def self.create
    song = self.new("song")
    self.save (song)
    song
  end
  def self.new_by_name(name)
    song = self.new (name)
    song
  end
  def self.create_by_name(name)
    song = self.new(name)
    self.save (song)
    song
  end

  def self.find_by_name(name)
    self.all.each do |e|
      if (e.name == name)
        return e
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    find = self.find_by_name(name)
    if (find)
      return find
    else
      find = self.create_by_name(name)
    end
    find
  end

  def self.alphabetical
    sorted = self.all.sort do |l, h|
      l.name[0] <=> h.name[0]
    end
    sorted
  end

  def self.new_from_filename(filename)
    filename = filename.split (" - ")
    title = filename[1][0...-4]
    ret = Song.new(title)
    ret.artist_name = filename[0]

    ret
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    Song.save(song)
    song
  end

  def self.destroy_all
    self.all.length.times do
      self.all.pop
    end
  end
end
