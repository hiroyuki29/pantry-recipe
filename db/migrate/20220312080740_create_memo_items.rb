class CreateMemoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :memo_items do |t|
      t.integer :quantity
      t.boolean :done, null: false, default: false
      t.references :item, foreign_key: true
      t.references :memo, foreign_key: true

      t.timestamps
    end
    add_index :memo_items, [:item_id, :memo_id], unique: true
  end
end
