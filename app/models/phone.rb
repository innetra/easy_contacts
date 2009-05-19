class Phone < ActiveRecord::Base

  validates_presence_of :number

  belongs_to :owner,  :polymorphic => true
  belongs_to :type,   :class_name => 'PhoneType'

end
