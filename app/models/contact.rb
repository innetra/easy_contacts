class Contact < ActiveRecord::Base

  belongs_to                    :owner,               :polymorphic => true

  has_many                      :addresses,           :as => :owner
  has_many                      :emails,              :as => :owner
  has_many                      :instant_messengers,  :as => :owner
  has_many                      :phones,              :as => :owner
  has_many                      :websites,            :as => :owner

  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :emails
  accepts_nested_attributes_for :instant_messengers
  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :websites

end
