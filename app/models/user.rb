class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    @zenkaku = /\A[ぁ-んァ-ン一-龥]/
    @zenkaku_kana = /\A[ァ-ヶー－]+\z/
    validates :nickname
    validates :email, format: { with: /@.+/}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :family_name_kanji, format: { with: @zenkaku}
    validates :first_name_kanji, format: { with: @zenkaku}
    validates :family_name_kana, format: { with: @zenkaku_kana}
    validates :first_name_kana, format: { with: @zenkaku_kana}
    validates :birthday
   end

  has_many :items
  has_many :buyers
end
