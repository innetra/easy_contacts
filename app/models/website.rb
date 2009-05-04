class Website < ActiveRecord::Base
  
  validates_presence_of :address
  
  belongs_to            :owner, :polymorphic => true
  belongs_to            :website_type
  
end
