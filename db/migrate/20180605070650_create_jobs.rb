class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :source
      t.string :name
      t.text :snippet
      t.string :category
      t.string :posted_time
      t.string :posted_time_friendly
      t.string :url
      t.string :location
      t.string :city
      t.string :state
      t.string :country
      t.string :salary_source
      t.string :salary_interval
      t.integer :salary_max
      t.integer :salary_max_annual
      t.integer :salary_min
      t.string :industry_name
      t.references :hiring_company, foreign_key: true

      t.timestamps
    end
  end
end
