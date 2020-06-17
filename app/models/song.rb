require 'pry'
class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def note_ids=(names)
    names.each do |name|
      note = Note.create(content: name)
      notes << note
    end
  end
end
