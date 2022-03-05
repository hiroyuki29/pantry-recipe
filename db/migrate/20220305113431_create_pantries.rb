class CreatePantries < ActiveRecord::Migration[5.2]
  def change
    create_table :pantries do |t|
      t.integer :quantity
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
