class PeopleController < ApplicationController

  def index
    @people = Person.all :conditions => ["name LIKE ? OR last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%"], 
      :limit => 10, :order => "name, last_name"
  end

  def new
    @person = build_person_basic_items(Person.new)
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
  end

  def edit
    @person = build_person_basic_items(Person.find_by_id(params[:id]))
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

  protected
  
    def build_person_basic_items(person)
      if person.phones.blank?
        person.phones.build #work
        person.phones.build :phone_type_id => 4 # fax
      end
      if person.emails.blank?
        person.emails.build
        person.emails.build      
      end
      person.instant_messengers.build if person.instant_messengers.blank?
      person.websites.build if person.websites.blank?
      person.addresses.build if person.addresses.blank?
      person
    end
    
end
