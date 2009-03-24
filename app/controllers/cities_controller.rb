class CitiesController < ApplicationController

  def index
    @cities = City.all(:conditions => ["name LIKE ?", "%#{params[:search]}%"], :limit => 10, :order => "name")
    render :template => nil
  end

end
