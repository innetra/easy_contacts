module WebSitesHelper
  def place_web_site_form(record_or_name, *args)
    options = {}
    case record_or_name
      when String, Symbol
        options[:fields_prefix] = "#{record_or_name}[web_site_attributes][]"
        owner = args.first
      else
        owner = record_or_name
        options[:fields_prefix] = "#{dom_class(owner)}[web_site_attributes][]"
    end
    render :partial => "web_sites/web_sites", :locals => { :owner => owner, :options => options }
  end
end
