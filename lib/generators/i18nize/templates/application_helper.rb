module ApplicationI18nHelper

  def translate_options_for( collection )
    collection.map do |translation|
      [ t(translation[0].downcase.gsub( /\s/ , "_" )), 
        translation[1] ]
    end
  end
  
    def error_explanation_for(record)
    explanation = ""
    explanation =  <<-ERROR_EXPLANATION if record.errors.any? 
    <div id="error_explanation">
      <h2> 
             #{ record.errors.count } #{t('error', :count => record.errors.count)} #{t('prohibited_from_being_saved', :count => record.errors.count)} #{t("#{record.class.to_s}.gender", :count => 1)} 
      </h2>

      <ul>
       #{ list_error_items_for record.errors.full_messages} 
      </ul>
    </div>

    ERROR_EXPLANATION
    explanation.html_safe
  end
 
  def list_error_items_for (msgs)
    final = ""
   msgs.each do |msg| 
     final << "<li>" << msg << "</li>\n"
   end
    final
  end 
end
