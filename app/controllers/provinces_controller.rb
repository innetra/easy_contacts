class ProvincesController < ApplicationController

  def index
    @provinces = Province.all(:conditions => ["name LIKE ?", "%#{params[:search]}%"], :limit => 10, :order => "name")
    render :template => nil
  end

end
