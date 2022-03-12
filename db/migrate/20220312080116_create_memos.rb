class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
