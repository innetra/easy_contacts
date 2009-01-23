module PhonesHelper
  def place_phone_form(record_or_name, *args)
    options = {}
    case record_or_name
      when String, Symbol
        options[:fields_prefix] = "#{record_or_name}[phone_attributes][]"
        owner = args.first
      else
        owner = record_or_name
        options[:fields_prefix] = "#{dom_class(owner)}[phone_attributes][]"
    end
    render :partial => "phones/phones", :locals => { :owner => owner, :options => options }
  end
end
