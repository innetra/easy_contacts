class InstantMessengersController < ApplicationController

  def destroy
    @instant_messenger = InstantMessenger.find(params[:id])
    @instant_messenger.destroy
  end

end
