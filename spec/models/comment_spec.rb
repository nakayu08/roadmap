require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'textが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'textが空では保存できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text を入力してください")

      end
      it 'taskが紐付いていないと保存できない' do
        @comment.task = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Task must exist")

      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")

      end
    end
  end
end
