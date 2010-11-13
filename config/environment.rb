# Load the rails application
require File.expand_path('../application', __FILE__)

#Sass::Plugin.options[:template_location] = "#{Rails.root}/app/styles"
Sass::Plugin.options[:template_location] = { 'app/styles' => 'public/stylesheets' }

# Initialize the rails application
Endcap::Application.initialize!