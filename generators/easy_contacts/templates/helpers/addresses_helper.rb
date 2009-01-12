module AddressesHelper
  def place_address_form(owner)
    render :partial => "addresses/addresses", :locals => { :owner => owner }
  end
end
