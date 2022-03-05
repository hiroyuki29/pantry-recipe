class Item < ApplicationRecord
  belongs_to :category
  belongs_to :master_food, optional: true
  belongs_to :user
  has_many :pantries
  has_many :users, through: :pantries

  validates :name, presence: true
  validates :unit_quantity, numericality: true
end
