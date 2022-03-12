class CreateMemoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :memo_items do |t|
      t.references :item, foreign_key: true
      t.references :memo, foreign_key: true

      t.timestamps
    end
  end
end
