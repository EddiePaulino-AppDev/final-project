class CreateConnectDisciplines < ActiveRecord::Migration[5.1]
  def change
    create_table :connect_disciplines do |t|
      t.integer :guide_id
      t.integer :discipline_id

      t.timestamps
    end
  end
end
