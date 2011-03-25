class FestivalEvents < ActiveRecord::Base
  belongs_to :festival
  belongs_to :event
end
