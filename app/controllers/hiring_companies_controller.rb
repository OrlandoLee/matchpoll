class HiringCompaniesController < ApplicationController
  before_action :set_hiring_company, only: [:show, :edit, :update, :destroy]

  # GET /hiring_companies
  # GET /hiring_companies.json
  def index
    @hiring_companies = HiringCompany.all
  end

  # GET /hiring_companies/1
  # GET /hiring_companies/1.json
  def show
  end

  # GET /hiring_companies/new
  def new
    @hiring_company = HiringCompany.new
  end

  # GET /hiring_companies/1/edit
  def edit
  end

  # POST /hiring_companies
  # POST /hiring_companies.json
  def create
    @hiring_company = HiringCompany.new(hiring_company_params)

    respond_to do |format|
      if @hiring_company.save
        format.html { redirect_to @hiring_company, notice: 'Hiring company was successfully created.' }
        format.json { render :show, status: :created, location: @hiring_company }
      else
        format.html { render :new }
        format.json { render json: @hiring_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hiring_companies/1
  # PATCH/PUT /hiring_companies/1.json
  def update
    respond_to do |format|
      if @hiring_company.update(hiring_company_params)
        format.html { redirect_to @hiring_company, notice: 'Hiring company was successfully updated.' }
        format.json { render :show, status: :ok, location: @hiring_company }
      else
        format.html { render :edit }
        format.json { render json: @hiring_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hiring_companies/1
  # DELETE /hiring_companies/1.json
  def destroy
    @hiring_company.destroy
    respond_to do |format|
      format.html { redirect_to hiring_companies_url, notice: 'Hiring company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hiring_company
      @hiring_company = HiringCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hiring_company_params
      params.require(:hiring_company).permit(:name, :url, :description)
    end
end
