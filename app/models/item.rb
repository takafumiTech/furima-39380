class Item < ApplicationRecord

  belongs_to       :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :processing_time

  validates :name,        :string,  presence: true
  validates :description, :text,    presence: true

  with_options presence: true, numericality: {greater_than: 300, less_than: 9999999}, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :quality_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :processing_time_id, numericality: { other_than: 1 , message: "can't be blank"}

end
