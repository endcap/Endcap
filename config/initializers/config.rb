yml = YAML.load_file("#{Rails.root}/config/config.yml")
CONFIG = yml[Rails.env] || yml["test"]