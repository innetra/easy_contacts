namespace :easy_contacts do
  desc "Initial database setup for easy_contacts"
  task :init => :environment do

    # Create Phone, Email, Instant Messenger, Web Address and Addresses types
    PhoneType.create!(:description => "Work")
    PhoneType.create!(:description => "Movil")
    PhoneType.create!(:description => "Home")
    PhoneType.create!(:description => "Fax")
    PhoneType.create!(:description => "Pager")
    PhoneType.create!(:description => "Skype")
    PhoneType.create!(:description => "Other")

    EmailType.create!(:description => "Work")
    EmailType.create!(:description => "Home")
    EmailType.create!(:description => "Otro")

    InstantMessengerProtocol.create!(:name => "AIM")
    InstantMessengerProtocol.create!(:name => "Google Talk")
    InstantMessengerProtocol.create!(:name => "ICQ")
    InstantMessengerProtocol.create!(:name => "Jabber")
    InstantMessengerProtocol.create!(:name => "MSN")
    InstantMessengerProtocol.create!(:name => "Skype")
    InstantMessengerProtocol.create!(:name => "Yahoo")
    InstantMessengerProtocol.create!(:name => "Other")

    InstantMessengerType.create!(:description => "Work")
    InstantMessengerType.create!(:description => "Home")
    InstantMessengerType.create!(:description => "Other")

    WebsiteType.create!(:description => "Work")
    WebsiteType.create!(:description => "Home")
    WebsiteType.create!(:description => "Other")

    AddressType.create!(:description => "Work")
    AddressType.create!(:description => "Home")
    AddressType.create!(:description => "Other")

    # Country
    Country.create!(:name => "México")

  end
end
