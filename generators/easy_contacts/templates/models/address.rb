class Address < ActiveRecord::Base
  belongs_to :contact
  belongs_to :address_type
  belongs_to :country
end
