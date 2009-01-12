module EmailsHelper
  def place_email_form(owner)
    render :partial => "emails/emails", :locals => { :owner => owner }
  end
end
