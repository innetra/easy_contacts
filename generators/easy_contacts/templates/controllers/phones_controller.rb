class PhonesController < ApplicationController

  def destroy
    @phone = Phone.find(params[:id])
    @phone.destroy

    respond_to do |format|
      format.js
    end
  end

end
