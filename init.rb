config.to_prepare do
  ApplicationController.helper(AddressesHelper)
  ApplicationController.helper(EmailsHelper)
  ApplicationController.helper(InstantMessengersHelper)
  ApplicationController.helper(PhonesHelper)
  ApplicationController.helper(WebsitesHelper)
end
