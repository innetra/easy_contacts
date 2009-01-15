class WebSite < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :web_site_type
end
