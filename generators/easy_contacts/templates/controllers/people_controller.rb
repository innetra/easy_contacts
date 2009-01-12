class PeopleController < ApplicationController

  def new
    @person = Person.new

    @person.phones.build
    @person.phones.build(:phone_type_id => 2)
    @person.emails.build
    @person.emails.build(:email_type_id => 2)
    @person.instant_messengers.build
    @person.web_sites.build
    @person.addresses.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  def create
    @person = Person.new(params[:person])
    @person.user_id = current_user.id

    respond_to do |format|
      if @person.save
        flash[:notice] = t('people.flash.create')
        format.html { redirect_to(@person) }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @person = Person.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  def edit
    @person = Person.find_by_id(params[:id])
  end

  def update
    @person = Person.find_by_id(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        flash[:notice] = t('people.flash.update')
        format.html { redirect_to(@person) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

end
