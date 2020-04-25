class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :menu, foreign_key: true
      t.string :number
      t.string :number_unit
      t.string :rep
      t.string :rep_unit

      t.timestamps
    end
  end
end
