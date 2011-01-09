class BandMembership < ActiveRecord::Base
  belongs_to :band
  belongs_to :user
  
  def start_year
    start_date && start_date.year || 'ever'
  end
  
  def end_year
    end_date && end_date.year || 'now'
  end
end
