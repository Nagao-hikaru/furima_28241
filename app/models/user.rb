class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates :nickname, presence: true
  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }
  validates :birthday, presence: true
  with_options presence: true, format: { with: NAME_REGEX, message: 'Full-width characters' } do
    validates :family_name
    validates :last_name
  end
  validates :family_name_kana, presence: true, format: { with: KANA_REGEX, message: 'Full-width katakana characters' }
  validates :last_name_kana, presence: true, format: { with: KANA_REGEX, message: 'Full-width katakana characters' }
end
