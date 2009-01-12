class Contact < ActiveRecord::Base

  has_many :phones
  has_many :emails
  has_many :instant_messengers
  has_many :web_sites
  has_many :addresses

  after_update :save_attributes

  def email_attributes=(email_attributes)
    email_attributes.each do |attributes|
      if attributes[:id].blank?
        emails.build(attributes)
      else
        email = emails.detect { |t| t.id == attributes[:id].to_i }
        email.attributes = attributes
      end
    end
  end

  def phone_attributes=(phone_attributes)
    phone_attributes.each do |attributes|
      if attributes[:id].blank?
        phones.build(attributes)
      else
        phone = phones.detect { |t| t.id == attributes[:id].to_i }
        phone.attributes = attributes
      end
    end
  end

  def instant_messenger_attributes=(instant_messenger_attributes)
    instant_messenger_attributes.each do |attributes|
      if attributes[:id].blank?
        instant_messengers.build(attributes)
      else
        instant_messenger = instant_messengers.detect { |t| t.id == attributes[:id].to_i }
        instant_messenger.attributes = attributes
      end
    end
  end

  def web_site_attributes=(web_site_attributes)
    web_site_attributes.each do |attributes|
      if attributes[:id].blank?
        web_sites.build(attributes)
      else
        web_site = web_sites.detect { |t| t.id == attributes[:id].to_i }
        web_site.attributes = attributes
      end
    end
  end

  def address_attributes=(address_attributes)
    address_attributes.each do |attributes|
      if attributes[:id].blank?
        addresses.build(attributes)
      else
        address = addresses.detect { |t| t.id == attributes[:id].to_i }
        address.attributes = attributes
      end
    end
  end

  def save_attributes

    phones.each do |t|
      t.save(false)
    end

    emails.each do |t|
      t.save(false)
    end

    instant_messengers.each do |t|
      t.save(false)
    end

    web_sites.each do |t|
      t.save(false)
    end

    addresses.each do |t|
      t.save(false)
    end

  end

end
