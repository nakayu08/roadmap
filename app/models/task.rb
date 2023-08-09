class Task < ApplicationRecord
  has_many :task_users
  has_many :users, through: :task_users, validate: false

  validates :title, presence: true
  validates :explanation, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :user_ids, presence: true

  validate :start_end_check
  validate :start_check
  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition

  private

  def start_end_check
    errors.add(:end_time, "は開始時刻より遅い時間を選択してください") if self.start_time > self.end_time
  end

  def start_check
    errors.add(:start_time, "は現在の日時より遅い時間を選択してください") if self.start_time < Time.now
  end

end
