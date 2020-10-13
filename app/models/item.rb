class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deli_char
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :ship_day
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40}
    validates :description, length: { maximum: 1000}
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :deli_char_id, numericality: { other_than: 1 }
    validates :ship_from_id, numericality: { other_than: 1 }
    validates :ship_days_id, numericality: { other_than: 1 }
  end
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},format: {with: /\A[0-9]+\z/}
end