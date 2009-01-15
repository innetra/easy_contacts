class CountriesController < ApplicationController

  def index
    @countries = Country.all(:conditions => ["name LIKE ?", "%#{params[:search]}%"] )
  end

end
