class Event < ActiveRecord::Base
  has_many :band_events
  has_many :bands, :through => :band_events
  belongs_to :venue
end