class Phone < ActiveRecord::Base
  
  validates_presence_of :number
  
  belongs_to :owner, :polymorphic => true
  belongs_to :phone_type
  
end
