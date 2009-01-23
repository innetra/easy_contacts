module AddressesHelper
  def place_address_form(record_or_name, *args)
    options = {}
    case record_or_name
      when String, Symbol
        options[:fields_prefix] = "#{record_or_name}[address_attributes][]"
        owner = args.first
      else
        owner = record_or_name
        options[:fields_prefix] = "#{dom_class(owner)}[address_attributes][]"
    end
    render :partial => "addresses/addresses", :locals => { :owner => owner, :options => options }
  end
end
