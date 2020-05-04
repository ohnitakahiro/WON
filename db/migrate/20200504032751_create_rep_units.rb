class CreateRepUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :rep_units do |t|
      t.string :rep_unit
      t.timestamps
    end
  end
end
