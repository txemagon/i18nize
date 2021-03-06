module I18nize
  module Generators
  
    class CreateGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      
      desc <<DESC 
Creates the basic methods that are based on the views. Remember to add support for directories in your config files.

  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**',     '*.{rb,yml}')]
DESC

      def helper_config
        directory(File.expand_path("../../../templates", __FILE__), "lib/templates")
        copy_file("application_helper.rb", "app/helpers/application_i18n_helper.rb") 
      end
      
      def final_info
         info = <<INFO_F   
Remember to add support for directories in your config files.

  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**',     '*.{rb,yml}')]
INFO_F
       puts info
       end
      
    end
    
  end
end
