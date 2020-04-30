class CreateMenuSelects < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_selects do |t|
      t.string :menu_name
      t.timestamps
    end
  end
end
