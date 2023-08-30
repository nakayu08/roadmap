class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :text, presence: { message: "を入力してください" }
end
