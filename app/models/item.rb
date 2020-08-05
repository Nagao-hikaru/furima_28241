class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :burden
  belongs_to_active_hash :delivery_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
    validates :condition
    validates :category
    validates :area
    validates :burden
    validates :delivery_day
  end

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999, message: 'Out of setting range' }

  with_options numericality: { other_than: 1, message: 'select' } do
    validates :condition_id
    validates :category_id
    validates :area_id
    validates :burden_id
    validates :delivery_day_id
  end
end
