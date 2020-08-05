class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :burden
  belongs_to_active_hash :delivery_day
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  validates :name, :description, :price, :condition, :category, :area, :burden, :delivery_day, presence: true

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999, message: 'Out of setting range' }

  validates :condition_id, numericality: { other_than: 1, message: 'select' }
  validates :category_id, numericality: { other_than: 1, message: 'select' }
  validates :area_id, numericality: { other_than: 1, message: 'select' }
  validates :burden_id, numericality: { other_than: 1, message: 'select' }
  validates :delivery_day_id, numericality: { other_than: 1, message: 'Select' }
end
