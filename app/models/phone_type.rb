class PhoneType < ActiveRecord::Base
  
  validates_presence_of :description
  
end
