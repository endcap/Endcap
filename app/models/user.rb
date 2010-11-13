class User < ActiveRecord::Base
  acts_as_authentic
  has_many :bands
  
  def full_name
    [self.first_name, self.last_name].join(" ")
  end
  
  def location
    [self.city, self.state].join(", ")
  end
end
