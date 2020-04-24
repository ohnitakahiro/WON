class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.string :part

      t.timestamps
    end
  end
end
