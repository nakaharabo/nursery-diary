class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :room_users
         has_many :rooms, through: :room_users

         with_options presence: true do
          validates :child_nickname
          validates :email, uniqueness: true
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
         
          with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
           validates :last_name
           validates :first_name
           validates :parent_name
         end
         with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
           validates :last_name_kana
           validates :first_name_kana
         end
           
       end
end
