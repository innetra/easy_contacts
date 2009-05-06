module PeopleHelper
  
  def insert_company_name_text_field_with_autocomplete(form)
    form.fields_for(:company, form.object.company || Company.new) do |company_fields|
      content_tag(:p) do
        company_name = company_fields.label :name
        company_name << tag(:br)
        company_name << company_fields.text_field(:name, :size => '40', :autocomplete => :off)
        company_name << content_tag(:div, nil, :id => 'company_name_auto_complete', 
          :class => 'auto_complete', 
          :style => 'display: none;')
        company_name << javascript_tag(<<-JSCODE
          var company_name_auto_completer = new Ajax.Autocompleter('company_name',
            'company_name_auto_complete',
            '#{companies_url(:js)}',
            { callback:function(element, value) { return 'search=' + element.value }, method:'get' })
          JSCODE
        )
      end
    end
  end
  
end