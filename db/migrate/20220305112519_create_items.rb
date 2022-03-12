class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.references :master_food, foreign_key: true
      t.integer :unit_quantity

      t.timestamps
    end
  end
end
