class WebSite < ActiveRecord::Base
  belongs_to :contact
  belongs_to :web_site_type
end
