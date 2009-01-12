class WebSitesController < ApplicationController

  def destroy
    @web_site = WebSite.find(params[:id])
    @web_site.destroy

    respond_to do |format|
      format.js
    end
  end

end
