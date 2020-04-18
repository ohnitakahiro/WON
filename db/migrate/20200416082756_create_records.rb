class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :name
      t.string :text
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
