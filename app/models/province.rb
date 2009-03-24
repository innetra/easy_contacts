class Province < ActiveRecord::Base
  belongs_to :country
  has_many :citites
end
