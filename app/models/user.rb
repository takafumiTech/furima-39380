class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :birthday,            presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name_kanji
    validates :last_name_kanji
  end

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '英数字混在で入力してください' } do
    validates :password
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
    validates :first_name_furigana
    validates :last_name_furigana
  end

  has_many :items
  # has_many :comments
  has_many :orders
end
