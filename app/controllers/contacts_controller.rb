class ContactsController < ApplicationController
  def index
    if params.has_key?(:search)
      @contacts = Contact.all(:conditions => ["name LIKE ? OR last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%"],
        :limit => 10, :order => "name, last_name")
    else
      @contacts = Contact.all(:order => "name, last_name")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :template => nil }
      format.xml  { render :xml => @contacts }
    end
  end
end
