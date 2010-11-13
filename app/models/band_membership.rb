class BandMembership < ActiveRecord::Base
  has_one :band
  has_one :user
end
