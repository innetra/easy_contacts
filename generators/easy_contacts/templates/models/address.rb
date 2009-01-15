class Address < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  belongs_to :address_type
  belongs_to :city
  belongs_to :country
  belongs_to :province

  def city_name
    city.name if city
  end

  def city_name=(name)
    self.city = City.find_or_create_by_name(name) unless name.blank?
  end

  def province_name
    province.name if province
  end

  def province_name=(name)
    self.province = Province.find_or_create_by_name(name) unless name.blank?
  end

  def country_name
    country.name if country
  end

  def country_name=(name)
    self.country = Country.find_or_create_by_name(name) unless name.blank?
  end

end
