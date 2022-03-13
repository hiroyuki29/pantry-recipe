# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :pantries, dependent: :destroy
  has_many :user_items, dependent: :destroy
  has_many :memo_users, dependent: :destroy
  has_many :pantry_items, through: :pantries, source: :item
  has_many :items, through: :user_items, source: :item
  has_many :memos, through: :memo_users, source: :memo

  def store_to_pantry(item, quantity)
    pantries.find_or_create_by(item_id: item.id, quantity: quantity)
  end

  def store_to_user(item)
    user_items.find_or_create_by(item_id: item.id)
  end

  def store_to_memo_user(memo)
    memo_users.find_or_create_by(memo_id: memo.id)
  end

  def remove_from_pantry(item)
    pantry = pantries.find_by(item_id: item.id)
    pantry.destroy if pantry
  end

  def remove_from_user(item)
    pantry = user_items.find_by(item_id: item.id)
    pantry.destroy if pantry
  end
end
