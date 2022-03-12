class Item < ApplicationRecord
  belongs_to :category
  belongs_to :master_food, optional: true
  has_many :pantries, dependent: :destroy
  has_many :user_items, dependent: :destroy
  has_many :users, through: :pantries, source: :user
  has_many :users_belong_to_item, through: :user_items, source: :user

  validates :name, presence: true
  validates :unit_quantity, numericality: true
end
