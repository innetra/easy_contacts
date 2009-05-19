class Website < ActiveRecord::Base

  validates_presence_of :address

  belongs_to            :owner, :polymorphic => true
  belongs_to            :type,  :class_name => 'WebsiteType'

end
