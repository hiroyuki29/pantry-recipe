class AddunitQuantityToMasterFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :master_foods, :unit_quantity, :integer
  end
end
