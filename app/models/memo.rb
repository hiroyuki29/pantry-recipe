class Memo < ApplicationRecord
  has_many :memo_users, dependent: :destroy
  has_many :memo_items, dependent: :destroy
  has_many :users, through: :memo_users, source: :user
  has_many :items, through: :memo_items, source: :item
  validates :name, presence: true, uniqueness: { scope: :password }
  validates :password, presence: true

  def store_to_memo_item(item, quantity)
    memo_items.find_or_create_by(item_id: item.id, quantity: quantity)
  end
end
