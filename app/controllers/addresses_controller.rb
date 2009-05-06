class AddressesController < ApplicationController

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
  end

end
