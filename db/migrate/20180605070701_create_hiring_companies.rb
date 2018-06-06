class CreateHiringCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :hiring_companies do |t|
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
