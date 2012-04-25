source_root File.expand_path("../lib/templates", __FILE__)
source_root File.expand_path("../lib/generators/i18nize", __FILE__)

copy_file("application_helper.rb", "app/helpers/application_i18n_helper.rb") 
directory("templates", "lib/templates")

puts <<INFO_F   
Remember to add support for directories in your config files.

  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**',     '*.{rb,yml}')]
INFO_F

