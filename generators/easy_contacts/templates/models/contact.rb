class Contact < ActiveRecord::Base

  belongs_to    :owner,              :polymorphic => true

  has_many      :addresses,          :as => :owner
  has_many      :emails,             :as => :owner
  has_many      :instant_messengers, :as => :owner
  has_many      :phones,             :as => :owner
  has_many      :web_sites,          :as => :owner

  after_update  :save_attributes

  def email_attributes=(email_attributes)
    email_attributes.each do |attributes|

      if attributes[:id].blank? && !attributes[:address].blank?
        emails.build(attributes)
      end

      unless attributes[:id].blank?
        email = emails.detect { |t| t.id == attributes[:id].to_i }
        unless attributes[:address].blank?
          email.attributes = attributes
        else
          email.delete
        end
      end

    end
  end

  def phone_attributes=(phone_attributes)
    phone_attributes.each do |attributes|
      if attributes[:id].blank? && !attributes[:number].blank?
        phones.build(attributes)
      end

      unless attributes[:id].blank?
        phone = phones.detect { |t| t.id == attributes[:id].to_i }
        unless attributes[:number].blank?
          phone.attributes = attributes
        else
          phone.delete
        end
      end
    end
  end

  def instant_messenger_attributes=(instant_messenger_attributes)
    instant_messenger_attributes.each do |attributes|
      if attributes[:id].blank? && !attributes[:nick].blank?
        instant_messengers.build(attributes)
      end
      unless attributes[:id].blank?
        instant_messenger = instant_messengers.detect { |t| t.id == attributes[:id].to_i }
        unless attributes[:nick].blank?
          instant_messenger.attributes = attributes
        else
          instant_messenger.delete
        end
      end
    end
  end

  def web_site_attributes=(web_site_attributes)
    web_site_attributes.each do |attributes|
      if attributes[:id].blank? && !attributes[:address].blank?
        web_sites.build(attributes)
      end
      unless attributes[:id].blank?
        web_site = web_sites.detect { |t| t.id == attributes[:id].to_i }
        unless attributes[:address].blank?
          web_site.attributes = attributes
        else
          web_site.delete
        end
      end
    end
  end

  def address_attributes=(address_attributes)
    address_attributes.each do |attributes|
      if attributes[:id].blank? && !attributes[:address].blank?
        addresses.build(attributes)
      end
      unless attributes[:id].blank?
        address = addresses.detect { |t| t.id == attributes[:id].to_i }
        unless attributes[:address].blank?
          address.attributes = attributes
        else
          address.delete
        end
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
