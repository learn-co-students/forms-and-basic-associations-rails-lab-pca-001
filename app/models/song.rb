class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def genre_id
    genre ? genre.id : nil
  end

  def notes=(strings)
    strings.each do |string|
      next if string.empty?

      note = Note.find_or_create_by(content: string)
      notes << note
    end
  end
end
