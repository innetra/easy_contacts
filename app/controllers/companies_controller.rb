class CompaniesController < ApplicationController

  def index
    @companies = Company.all(:conditions => ["name LIKE ?", "%#{params[:search]}%"], :limit => 10, :order => "name")
    render :layout => 'sidebar'
  end

  def new
    @company = build_company_basic_items(Company.new)
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
    render :layout => 'sidebar'
  end

  def edit
    @company = build_company_basic_items(Company.find_by_id(params[:id]))
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

  protected
  
    def build_company_basic_items(company)
      if company.phones.blank?
        company.phones.build #work
        company.phones.build :phone_type_id => 4 # fax
      end
      if company.emails.blank?
        company.emails.build
        company.emails.build      
      end
      company.instant_messengers.build if company.instant_messengers.blank?
      company.websites.build if company.websites.blank?
      company.addresses.build if company.addresses.blank?
      company
    end

end
