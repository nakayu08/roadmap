class Task < ApplicationRecord
  has_many :task_users, dependent: :destroy
  has_many :users, through: :task_users, validate: false
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :explanation, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :user_ids, presence: true

  validate :start_end_check
  #validate :start_check
  
  validates :category_id, numericality: { other_than: 1, message: "を選択してください" } 
  validates :condition_id, numericality: { other_than: 1, message: "を選択してください" } 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition

  private

  def start_end_check
    errors.add(:end_time, "は開始時刻より遅い時間を選択してください") if self.start_time > self.end_time
  end

end
