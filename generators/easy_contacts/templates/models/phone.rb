class Phone < ActiveRecord::Base
  belongs_to :contact
  belongs_to :phone_type
end
