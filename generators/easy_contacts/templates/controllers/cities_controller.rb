class CitiesController < ApplicationController

  def index
    @cities = City.all(:conditions => ["name LIKE ?", "%#{params[:search]}%"] )
  end

end
