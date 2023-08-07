class Task < ApplicationRecord
  has_many :task_users
  has_many :users, through: :task_users

  validates :title, presence: true
  validates :explanation, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
end
