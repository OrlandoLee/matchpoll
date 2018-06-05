json.extract! job, :id, :source, :name, :snippet, :category, :posted_time, :posted_time_friendly, :url, :location, :city, :state, :country, :salary_source, :salary_interval, :salary_max, :salary_max_annual, :salary_min, :industry_name, :hiring_company_id, :created_at, :updated_at
json.url job_url(job, format: :json)
