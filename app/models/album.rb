class Album < ActiveRecord::Base
  belongs_to :band
  has_many :users
  has_many :songs
end
