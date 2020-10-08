class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  
  with_options presence: true do
    validates :email, format: { with: /@.+/}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :family_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/} 
  end
  validates :birthday, presence: true

  has_many :items
  has_many :buyers
end
