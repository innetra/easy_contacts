class InstantMessenger < ActiveRecord::Base

  validates_presence_of :nick

  belongs_to :owner,    :polymorphic => true
  belongs_to :protocol, :class_name => 'InstantMessengerProtocol'
  belongs_to :type,     :class_name => 'InstantMessengerType'

end
