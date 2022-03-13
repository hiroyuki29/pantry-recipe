class MemoItem < ApplicationRecord
  belongs_to :item
  belongs_to :memo

  validates :memo_id, uniqueness: { scope: :item_id }
end
