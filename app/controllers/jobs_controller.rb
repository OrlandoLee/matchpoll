class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def landing
  end
  # GET /jobs
  # GET /jobs.json
  def index
    url = 'https://api.ziprecruiter.com/jobs/v1'
    zip_params = {}
    zip_params['api_key'] = ENV["ZIP_API_KEY"]
    zip_params['search'] = params['search']
    zip_params['location'] = params['location']
    zip_params['radius_miles'] = 25
    zip_params['page'] = params['page'].present? ? params['page'].to_i : 1
    zip_params['jobs_per_page'] = 10
    zip_params['days_ago'] = params['days_ago']
    zip_params['refine_by_salary'] = params['refine_by_salary']
    
    begin
       response = RestClient.get url, {params: zip_params}
       parsed_response = JSON.parse(response)
       @total_jobs = parsed_response['total_jobs']
       @jobs = []
       parsed_response['jobs'].each do |job_json|
         @jobs <<  OpenStruct.new(job_json)
       end
       @has_prev = zip_params['page'] != 1
       @has_next = @total_jobs > zip_params['page'] * zip_params['jobs_per_page']
       next_page_params = params.dup
       next_page_params['page'] = zip_params['page'] + 1
       prev_page_params = params.dup
       prev_page_params['page'] = zip_params['page'] - 1
       @next_link = jobs_url(next_page_params.permit!)
       @prev_link = jobs_url(prev_page_params.permit!)
    rescue RestClient::ExceptionWithResponse => e
       render plain: "e.response"
    end    
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:source, :name, :snippet, :category, :posted_time, :posted_time_friendly, :url, :location, :city, :state, :country, :salary_source, :salary_interval, :salary_max, :salary_max_annual, :salary_min, :industry_name, :hiring_company_id)
    end
end
