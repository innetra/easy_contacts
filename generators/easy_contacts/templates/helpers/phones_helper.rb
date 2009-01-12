module PhonesHelper
  def place_phone_form(owner)
    render :partial => "phones/phones", :locals => { :owner => owner }
  end
end
