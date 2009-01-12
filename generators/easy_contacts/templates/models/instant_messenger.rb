class InstantMessenger < ActiveRecord::Base
  belongs_to :contact
  belongs_to :instant_messenger_protocol
  belongs_to :instant_messenger_type
end
