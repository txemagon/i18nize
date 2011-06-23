module I18nize
  module Generators
        
     class AddLanguageGenerator < Rails::Generators::Base
       source_root File.expand_path("../templates", __FILE__)
       
       argument :locale, :type => :string, :default => 'es'
       attr_reader :locale
       
       desc <<DESC 
Adds support files for a new language. Spanish (es) default.

Remember to switch to your preferred locale in the config files.

    config.i18n.default_locale = :es
    
DESC
       
       def  views
         %w{activerecord devise}.each do |f|
          copy_file(File.join("locales", file_name(f)), "config/locales/i18n_#{ file_name(f) }")
         end
         copy_file(File.join("locales", "#{@locale}.yml"), "config/locales/i18n_#{ @locale}.yml")
       end   
   
       def final_info
         info = <<INFO_F   
Remember to switch to your preferred locale in the config files.

    config.i18n.default_locale = :es

INFO_F
       puts info
       end
           
       private
       
       def file_name(name, ext="yml")
         "#{name}.#{@locale}.#{ext}"
       end

    end

  end
end
