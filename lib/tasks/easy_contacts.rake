namespace :easy_contacts do
  desc "Initial database setup for easy_contacts"
  task :init => :environment do

    # Create Phone, Email, Instant Messenger, Web Address and Addresses types
    PhoneType.create!(:description => "Oficina")
    PhoneType.create!(:description => "Móvil")
    PhoneType.create!(:description => "Casa")
    PhoneType.create!(:description => "Fax")
    PhoneType.create!(:description => "Pager")
    PhoneType.create!(:description => "Skype")
    PhoneType.create!(:description => "Otro")

    EmailType.create!(:description => "Trabajo")
    EmailType.create!(:description => "Personal")
    EmailType.create!(:description => "Otro")

    InstantMessengerProtocol.create!(:name => "AIM")
    InstantMessengerProtocol.create!(:name => "Google Talk")
    InstantMessengerProtocol.create!(:name => "ICQ")
    InstantMessengerProtocol.create!(:name => "Jabber")
    InstantMessengerProtocol.create!(:name => "MSN")
    InstantMessengerProtocol.create!(:name => "Skype")
    InstantMessengerProtocol.create!(:name => "Yahoo")
    InstantMessengerProtocol.create!(:name => "Otro")

    InstantMessengerType.create!(:description => "Trabajo")
    InstantMessengerType.create!(:description => "Personal")
    InstantMessengerType.create!(:description => "Otro")

    WebSiteType.create!(:description => "Trabajo")
    WebSiteType.create!(:description => "Personal")
    WebSiteType.create!(:description => "Otro")

    AddressType.create!(:description => "Trabajo")
    AddressType.create!(:description => "Personal")
    AddressType.create!(:description => "Otro")

    # Country
    Country.create!(:name => "México")

  end
end
