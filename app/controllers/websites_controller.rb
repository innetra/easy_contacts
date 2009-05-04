class WebsitesController < ApplicationController

  def destroy
    @website = Website.find(params[:id])
    @website.destroy

    respond_to do |format|
      format.js
    end
  end

end
