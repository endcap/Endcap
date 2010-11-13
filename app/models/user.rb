class User < ActiveRecord::Base
  acts_as_authentic
  
  def full_name
    [self.first_name, self.last_name].join(" ")
  end
end
