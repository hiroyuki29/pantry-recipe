class MemoItem < ApplicationRecord
  belongs_to :item
  belongs_to :memo
end
