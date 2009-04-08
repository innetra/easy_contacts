class CountriesController < ApplicationController

  def index
    @countries = Country.all(:conditions => ["name LIKE ?", "%#{params[:search]}%"], :limit => 10, :order => "name")
    render :template => nil
  end

end
