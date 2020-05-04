class CreateNumberUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :number_units do |t|
      t.string :number_unit
      t.timestamps
    end
  end
end
