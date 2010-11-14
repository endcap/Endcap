class User < ActiveRecord::Base
  acts_as_authentic
  has_many :band_memberships
  has_many :bands, :through => :band_memberships
  has_many :venues
  
  def full_name
    [self.first_name, self.last_name].join(" ")
  end
  
  def location
    [self.city, self.state].join(", ")
  end
end
