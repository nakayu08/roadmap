class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_many :task_users
  has_many :tasks, through: :task_users
  has_many :comments, dependent: :destroy
  
  validates :nickname, presence: true
  validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

  validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
