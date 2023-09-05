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
        expect(@comment.errors.full_messages).to include("コメントを入力してください")

      end
      it 'taskが紐付いていないと保存できない' do
        @comment.task = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Taskを入力してください")

      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")

      end
    end
  end
end
