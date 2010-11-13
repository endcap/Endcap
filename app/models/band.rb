class Band < ActiveRecord::Base
  has_many :users, :through => :band_memberships
end
