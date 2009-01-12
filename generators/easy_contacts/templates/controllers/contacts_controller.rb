class ContactsController < ApplicationController
  def index
    @people = Person.all(:order => "name, last_name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end
end
