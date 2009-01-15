class CompaniesController < ApplicationController

  def index
    if params.has_key?(:search)
      @companies = Company.all(:conditions => ["name LIKE ?", "%#{params[:search]}%"] )
    else
      @companies = Company.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.xml  { render :xml => @companies }
    end
  end

  def new
    @company = Company.new
    2.times { @company.phones.build }
    @company.emails.build
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
