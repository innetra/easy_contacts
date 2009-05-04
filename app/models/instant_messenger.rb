class InstantMessenger < ActiveRecord::Base
  
  validates_presence_of :nick
  
  belongs_to :owner, :polymorphic => true
  belongs_to :instant_messenger_protocol
  belongs_to :instant_messenger_type
  
end
