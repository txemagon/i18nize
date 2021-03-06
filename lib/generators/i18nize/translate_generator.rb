module I18nize
  module Generators
     
     class TranslateGenerator < Rails::Generators::NamedBase
       source_root File.expand_path("../templates", __FILE__)
       desc <<DESC
Creates config/locale files
       
Example:
   rails g i18nize:translate Person name:nombre surname:apellidos --locale es
   
   Use a dash to indicate no translation
   rails g i18nize:translate Person plaza:- surname:apellidos --locale es  
DESC

       argument :attributes, :type => :array, :default => [], :banner => "field:translation field:translation"       
       class_option :locale, :type => :string, :default => 'es', :banner => "<valid rails locale>"
       
       def data_request
         name.downcase!
         @singular_model_name    = ask("How do you say \"#{ name }\" in locale: #{ options[:locale] }?")
         @plural_model_name      = ask("How do you say \"#{ name.pluralize }\" in locale: #{ options[:locale] }?")
         @singular_model_name_wg = ask("How do you say \"the #{ name }\" (using gender) in locale: #{ options[:locale] }?")
         @plural_model_name_wg   = ask("How do you say \"the #{ name.pluralize }\" (using gender) in locale: #{ options[:locale] }?")
       end
 
       def models
         model_file = <<MODEL_FILE
#{options[:locale]}:
  #{ name.capitalize }:
    gender:
      one: "#{ @singular_model_name_wg }"
      other: "#{ @plural_model_name_wg }"
  activerecord:
    models:
      #{ name }: "#{ @singular_model_name }"
      #{ name.pluralize }: "#{ @plural_model_name }"
    attributes:
      #{ name }:
MODEL_FILE
       attributes.each do |att|
         att.type = att.name if att.type == :-
         model_file << "        #{ att.name }: \"#{ att.type.to_s }\"\n"
       end
       create_file "config/locales/model/#{ name }.#{ options[:locale] }.yml", model_file
       end
             
       def  views
       view_file = <<VIEW_FILE
#{ options[:locale] }:
  #{ name.pluralize }: "#{ @plural_model_name }"
  #{ name }:
    new: "#{ ask("How do you say \"new #{ name }\"?") }"
    edit: "#{ ask("How do you say \"edit #{ name }\"?") }"
    list: "#{ ask("How do you title \"the list of #{ name.pluralize }\"?") }"
VIEW_FILE

       create_file "config/locales/views/#{ name }.#{ options[:locale] }.yml", view_file
       end   

    private
    
      def model
         puts name
         puts options[:locale]
         attributes.each{ |a| puts a.name }
       end
    end

  end
end
