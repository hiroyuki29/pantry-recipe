class MemoUser < ApplicationRecord
  belongs_to :user
  belongs_to :memo
end
