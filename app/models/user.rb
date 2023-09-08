class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :first_name_kanji,    presence: true
  validates :last_name_kanji,     presence: true
  validates :first_name_furigana, presence: true
  validates :last_name_furigana,  presence: true
  validates :birthday,            presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角文字を使用してください" } do
    validate :first_name_kanji
    validate :last_name_kanji

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "英数字混在で入力してください" } do
    validate :encrypted_password

  with_options presence: true, format: { with: ,[ァ-ヶ一] message: "全角カナを使用してください" } do
    validates :first_name_furigana
    validates :last_name_furigana

  has_many :items
  has_many :comments
  has_many :orders
end
