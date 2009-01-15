class Phone < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :phone_type
end
