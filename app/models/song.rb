class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    artist ? artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_id
    genre ? genre.id : nil
  end

  def genre_id=(id)
    self.genre = Genre.find_by(id: id)
  end

  def notes=(notes)
    notes.each do |note_content|
      self.notes << Note.new(content: note_content) unless note_content == ""
    end
  end
end
