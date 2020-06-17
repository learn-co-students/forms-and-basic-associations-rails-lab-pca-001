class Artist < ActiveRecord::Base
  has_many :songs

  def foo=(val)
  end
end
