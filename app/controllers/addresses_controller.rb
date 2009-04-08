class AddressesController < ApplicationController

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.js
    end
  end

end
