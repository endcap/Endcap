Given /^I am logged in as "(.*)"$/ do |name|
  name = name.split(" ")
  @current_user = User.create!(
    :first_name => name[0],
    :last_name => name[1],
    :password => '1234',
    :password_confirmation => '1234',
    :email => "#{name.join('.').downcase}@email.com"
  )
  
  visit "/login" 
  fill_in("email", :with => "#{name.join('.').downcase}@email.com") 
  fill_in("password", :with => '1234') 
  click_button("Login")
end

Given /^I am not logged in$/ do
  visit "/logout"
end

Given /^I have a user named "(.+)"$/ do |name|
  name = name.split(" ")
  User.create!(
    :first_name => name[0],
    :last_name => name[1],
    :password => '1234',
    :password_confirmation => '1234',
    :email => "#{name.join('.').downcase}@email.com"
  )
end