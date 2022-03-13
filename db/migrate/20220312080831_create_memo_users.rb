class CreateMemoUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :memo_users do |t|
      t.references :user, foreign_key: true
      t.references :memo, foreign_key: true

      t.timestamps
    end
    add_index :memo_users, [:user_id, :memo_id], unique: true
  end
end
