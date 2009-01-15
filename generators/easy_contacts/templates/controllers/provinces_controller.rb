class ProvincesController < ApplicationController

  def index
    @provinces = Province.all(:conditions => ["name LIKE ?", "%#{params[:search]}%"] )
  end

end
