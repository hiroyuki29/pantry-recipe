class CreatePantries < ActiveRecord::Migration[5.2]
  def change
    create_table :pantries do |t|
      t.integer :quantity
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
    add_index :pantries, [:user_id, :item_id], unique: true
  end
end
