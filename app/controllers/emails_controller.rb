class EmailsController < ApplicationController

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.js
    end
  end

end
