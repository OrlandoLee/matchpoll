require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { category: @job.category, city: @job.city, country: @job.country, hiring_company_id: @job.hiring_company_id, industry_name: @job.industry_name, location: @job.location, name: @job.name, posted_time: @job.posted_time, posted_time_friendly: @job.posted_time_friendly, salary_interval: @job.salary_interval, salary_max: @job.salary_max, salary_max_annual: @job.salary_max_annual, salary_min: @job.salary_min, salary_source: @job.salary_source, snippet: @job.snippet, source: @job.source, state: @job.state, url: @job.url } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { category: @job.category, city: @job.city, country: @job.country, hiring_company_id: @job.hiring_company_id, industry_name: @job.industry_name, location: @job.location, name: @job.name, posted_time: @job.posted_time, posted_time_friendly: @job.posted_time_friendly, salary_interval: @job.salary_interval, salary_max: @job.salary_max, salary_max_annual: @job.salary_max_annual, salary_min: @job.salary_min, salary_source: @job.salary_source, snippet: @job.snippet, source: @job.source, state: @job.state, url: @job.url } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
