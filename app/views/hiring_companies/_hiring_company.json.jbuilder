json.extract! hiring_company, :id, :name, :url, :description, :created_at, :updated_at
json.url hiring_company_url(hiring_company, format: :json)
