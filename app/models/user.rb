class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  validates :email, presence: true, uniqueness: true

  with_options presence: true do
    validates :nickname, presence: true
    validates :birthday, presence: true
  end
      
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ー]+\z/ } do
   validates :last_name 
   validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
   validates :last_name_katakana
   validates :first_name_katakana
  end

   with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do
    validates :password
    validates :password_confirmation
  end  
end
