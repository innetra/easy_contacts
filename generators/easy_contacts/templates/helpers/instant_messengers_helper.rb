module InstantMessengersHelper
  def place_instant_messenger_form(owner)
    render :partial => "instant_messengers/instant_messengers",
      :locals => { :owner => owner }
  end
end
