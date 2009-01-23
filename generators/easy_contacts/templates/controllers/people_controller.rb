class PeopleController < ApplicationController

  def index
    @people = Person.all(:conditions => ["name LIKE ? OR last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%"] )
  end

  def new
    @person = Person.new

    # Build Person contact fields
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
    # Build Person contact fields if blank
    if @person.phones.blank?
      @person.phones.build
      @person.phones.build(:phone_type_id => 2)
    end
    if @person.emails.blank?
      @person.emails.build
      @person.emails.build(:email_type_id => 2)
    end
    @person.instant_messengers.build if @person.instant_messengers.blank?
    @person.web_sites.build if @person.web_sites.blank?
    @person.addresses.build if @person.addresses.blank?
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
