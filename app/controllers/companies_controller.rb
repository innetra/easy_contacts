class CompaniesController < ApplicationController

  def index
    @companies = Company.all(:conditions => ["name LIKE ?", "%#{params[:search]}%"], :limit => 10, :order => "name")
  end

  def new
    @company = Company.new
    @company.setup_child_elements
  end

  def create
    @company = Company.new(params[:company])
    respond_to do |format|
      if @company.save
        flash[:notice] = t("companies.create.flash.notice", :default => 'Company created.')
        format.html { redirect_to(@company) }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        @company.setup_child_elements
        flash[:error] = t("companies.create.flash.error", :default => 'Company not created.')
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @company = Company.find_by_id(params[:id])
  end

  def edit
    @company = Company.find_by_id(params[:id])
    @company.setup_child_elements
  end

  def update
    @company = Company.find_by_id(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        flash[:notice] = t('companies.update.flash.notice', :default => 'Company updated.')
        format.html { redirect_to(@company) }
        format.xml  { head :ok }
      else
        @company.setup_child_elements
        flash[:error] = t('companies.update.flash.error', :default => 'Company not updated.')
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

end
