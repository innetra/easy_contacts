class EmailsController < ApplicationController

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
  end

end
