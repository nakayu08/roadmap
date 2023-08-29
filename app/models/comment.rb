class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :text, presence: { message: "コメントを入力してください" }
end
