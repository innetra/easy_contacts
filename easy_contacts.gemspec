# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{easy_contacts}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ivan Torres"]
  s.date = %q{2009-01-16}
  s.description = %q{Easy Contacts for Ruby on Rails 2.2 (i18n)}
  s.email = %q{mexpolk@gmail.com}
  s.extra_rdoc_files = ["tasks/init.rake"]
  s.files = ["tasks/init.rake", "generators/easy_contacts/easy_contacts_generator.rb", "generators/easy_contacts/templates/stylesheets/people.css", "generators/easy_contacts/templates/stylesheets/companies.css", "generators/easy_contacts/templates/stylesheets/default.css", "generators/easy_contacts/templates/helpers/emails_helper.rb", "generators/easy_contacts/templates/helpers/shadowbox_helper.rb", "generators/easy_contacts/templates/helpers/phones_helper.rb", "generators/easy_contacts/templates/helpers/web_sites_helper.rb", "generators/easy_contacts/templates/helpers/instant_messengers_helper.rb", "generators/easy_contacts/templates/helpers/addresses_helper.rb", "generators/easy_contacts/templates/helpers/form_helper.rb", "generators/easy_contacts/templates/migrations/easy_contacts.rb", "generators/easy_contacts/templates/views/phones/destroy.js.rjs", "generators/easy_contacts/templates/views/phones/_phones.html.erb", "generators/easy_contacts/templates/views/phones/_phone.html.erb", "generators/easy_contacts/templates/views/companies/index.html.erb", "generators/easy_contacts/templates/views/companies/show.html.erb", "generators/easy_contacts/templates/views/companies/edit.html.erb", "generators/easy_contacts/templates/views/companies/new.html.erb", "generators/easy_contacts/templates/views/companies/index.js.erb", "generators/easy_contacts/templates/views/companies/_company.html.erb", "generators/easy_contacts/templates/views/countries/index.js.erb", "generators/easy_contacts/templates/views/emails/destroy.js.rjs", "generators/easy_contacts/templates/views/emails/_email.html.erb", "generators/easy_contacts/templates/views/emails/_emails.html.erb", "generators/easy_contacts/templates/views/instant_messengers/destroy.js.rjs", "generators/easy_contacts/templates/views/instant_messengers/_instant_messengers.html.erb", "generators/easy_contacts/templates/views/instant_messengers/_instant_messenger.html.erb", "generators/easy_contacts/templates/views/people/index.html.erb", "generators/easy_contacts/templates/views/people/show.html.erb", "generators/easy_contacts/templates/views/people/edit.html.erb", "generators/easy_contacts/templates/views/people/new.html.erb", "generators/easy_contacts/templates/views/people/_person.html.erb", "generators/easy_contacts/templates/views/web_sites/_web_site.html.erb", "generators/easy_contacts/templates/views/web_sites/destroy.js.rjs", "generators/easy_contacts/templates/views/web_sites/_web_sites.html.erb", "generators/easy_contacts/templates/views/provinces/index.js.erb", "generators/easy_contacts/templates/views/contacts/_contact_info.html.erb", "generators/easy_contacts/templates/views/contacts/index.html.erb", "generators/easy_contacts/templates/views/contacts/_contact.html.erb", "generators/easy_contacts/templates/views/cities/index.js.erb", "generators/easy_contacts/templates/views/addresses/destroy.js.rjs", "generators/easy_contacts/templates/views/addresses/_address.html.erb", "generators/easy_contacts/templates/views/addresses/_addresses.html.erb", "generators/easy_contacts/templates/models/city.rb", "generators/easy_contacts/templates/models/web_site.rb", "generators/easy_contacts/templates/models/web_site_type.rb", "generators/easy_contacts/templates/models/phone.rb", "generators/easy_contacts/templates/models/country.rb", "generators/easy_contacts/templates/models/email.rb", "generators/easy_contacts/templates/models/address.rb", "generators/easy_contacts/templates/models/company.rb", "generators/easy_contacts/templates/models/email_type.rb", "generators/easy_contacts/templates/models/instant_messenger.rb", "generators/easy_contacts/templates/models/instant_messenger_protocol.rb", "generators/easy_contacts/templates/models/province.rb", "generators/easy_contacts/templates/models/instant_messenger_type.rb", "generators/easy_contacts/templates/models/phone_type.rb", "generators/easy_contacts/templates/models/address_type.rb", "generators/easy_contacts/templates/models/person.rb", "generators/easy_contacts/templates/models/contact.rb", "generators/easy_contacts/templates/controllers/web_sites_controller.rb", "generators/easy_contacts/templates/controllers/phones_controller.rb", "generators/easy_contacts/templates/controllers/people_controller.rb", "generators/easy_contacts/templates/controllers/emails_controller.rb", "generators/easy_contacts/templates/controllers/countries_controller.rb", "generators/easy_contacts/templates/controllers/cities_controller.rb", "generators/easy_contacts/templates/controllers/contacts_controller.rb", "generators/easy_contacts/templates/controllers/addresses_controller.rb", "generators/easy_contacts/templates/controllers/provinces_controller.rb", "generators/easy_contacts/templates/controllers/instant_messengers_controller.rb", "generators/easy_contacts/templates/controllers/companies_controller.rb", "generators/easy_contacts/templates/locales/en.easy_contacts.yml", "generators/easy_contacts/templates/locales/es-MX.easy_contacts.yml", "Rakefile", "Manifest", "easy_contacts.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/innetra/easy_authentication}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Easy_contacts"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{easy_contacts}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Easy Contacts for Ruby on Rails 2.2 (i18n)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
