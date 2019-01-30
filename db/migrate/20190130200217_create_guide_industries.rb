class CreateGuideIndustries < ActiveRecord::Migration[5.1]
  def change
    create_table :guide_industries do |t|
      t.integer :guide_id
      t.integer :industry_id

      t.timestamps
    end
  end
end
