class Contact < ActiveRecord::Base

  belongs_to                    :owner,               :polymorphic => true

  has_many                      :addresses,           :as => :owner
  has_many                      :emails,              :as => :owner
  has_many                      :instant_messengers,  :as => :owner
  has_many                      :phones,              :as => :owner
  has_many                      :websites,            :as => :owner

  accepts_nested_attributes_for :addresses,
    :reject_if => proc { |attributes| attributes['address'].blank? }
  accepts_nested_attributes_for :emails,
    :reject_if => proc { |attributes| attributes['address'].blank? }
  accepts_nested_attributes_for :instant_messengers,
    :reject_if => proc { |attributes| attributes['nick'].blank? }
  accepts_nested_attributes_for :phones,
    :reject_if => proc { |attributes| attributes['number'].blank? }
  accepts_nested_attributes_for :websites,
    :reject_if => proc { |attributes| attributes['address'].blank? }

  # Setup child elements for contact's
  def setup_child_elements
    if phones.empty?
      phones.build
      phones.build :type_id => 4 # fax
    end
    if emails.empty?
      emails.build
      emails.build
    end
    instant_messengers.build if instant_messengers.empty?
    websites.build if websites.empty?
    addresses.build if addresses.empty?
  end

end
