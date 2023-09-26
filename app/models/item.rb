class Item < ApplicationRecord
  belongs_to       :user
  has_one          :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :processing_time

  validates :name,        presence: true
  validates :description, presence: true
  validates :image,       presence: true

  with_options presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
    validates :price
  end

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :quality_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :processing_time_id, numericality: { other_than: 1, message: "can't be blank" }
end
