class Genre < ActiveRecord::Base
  has_many :songs
  has_many :Artists, through: :songs
end
