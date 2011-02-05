class UserSession < Authlogic::Session::Base
  find_by_login_method :find_by_email
  remember_me_for 1.year

end