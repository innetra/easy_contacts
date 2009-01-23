module InstantMessengersHelper
  def place_instant_messenger_form(record_or_name, *args)
    options = {}
    case record_or_name
      when String, Symbol
        options[:fields_prefix] = "#{record_or_name}[instant_messenger_attributes][]"
        owner = args.first
      else
        owner = record_or_name
        options[:fields_prefix] = "#{dom_class(owner)}[instant_messenger_attributes][]"
    end
    render :partial => "instant_messengers/instant_messengers", :locals => { :owner => owner, :options => options }
  end
end
