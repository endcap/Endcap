class Album < ActiveRecord::Base
  belongs_to :band
  has_many :users
end
