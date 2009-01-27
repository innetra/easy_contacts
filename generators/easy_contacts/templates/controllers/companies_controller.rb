class CompaniesController < ApplicationController

  def index
    @companies = Company.all(:conditions => ["name LIKE ?", "%#{params[:search]}%"], :limit => 10, :order => "name")
  end

  def new
    @company = Company.new
    # Build Person contact fields
    @company.phones.build
    @company.phones.build(:phone_type_id => 2)
    @company.emails.build
    @company.emails.build(:email_type_id => 2)
    @company.instant_messengers.build
    @company.web_sites.build
    @company.addresses.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        flash[:notice] = t("companies.flash.create")
        format.html { redirect_to(@company) }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @company = Company.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company }
    end
  end

  def edit
    @company = Company.find_by_id(params[:id])
    # Build Company contact fields if blank
    if @company.phones.blank?
      @company.phones.build
      @company.phones.build(:phone_type_id => 2)
    end
    if @company.emails.blank?
      @company.emails.build
      @company.emails.build(:email_type_id => 2)
    end
    @company.instant_messengers.build if @company.instant_messengers.blank?
    @company.web_sites.build if @company.web_sites.blank?
    @company.addresses.build if @company.addresses.blank?
  end

  def update
    @company = Company.find_by_id(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        flash[:notice] = t('companies.flash.update')
        format.html { redirect_to(@company) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end


end
