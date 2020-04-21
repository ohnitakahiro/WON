class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :name
      t.string :text
      t.string :image
      t.integer :user_id

      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
