module EmailsHelper
  def place_email_form(record_or_name, *args)
    options = {}
    case record_or_name
      when String, Symbol
        options[:fields_prefix] = "#{record_or_name}[email_attributes][]"
        owner = args.first
      else
        owner = record_or_name
        options[:fields_prefix] = "#{dom_class(owner)}[email_attributes][]"
    end
    render :partial => "emails/emails", :locals => { :owner => owner, :options => options }
  end
end
