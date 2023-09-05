require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @user=FactoryBot.create(:user)
    @task = FactoryBot.build(:task,user_ids: [@user.id])
  end

  describe 'タスク登録' do
    context 'タスク登録できる場合' do
      it 'title、start_time、end_time、category、condition、explanationが存在していれば保存できる' do
        expect(@task).to be_valid
      end
    end
    context 'タスク登録できない場合' do
      it 'titleが空では保存できない' do
        @task.title = ''
        @task.valid?
        expect(@task.errors.full_messages).to include "タスク名を入力してください"
      end
      it 'start_timeが空では保存できない' do
        @task.start_time = ''
        @task.valid?
        expect(@task.errors.full_messages).to include "開始時間を入力してください"
      end
      it 'end_timeが空では保存できない' do
        @task.end_time = ''
        @task.valid?
        expect(@task.errors.full_messages).to include "終了時間を入力してください"
      
      end
      it 'start_timeよりend_timeが早い場合は保存できない' do
        @task.end_time = @task.start_time - 10
        @task.valid?
        expect(@task.errors.full_messages).to include "終了時間は開始時刻より遅い時間を選択してください"
      end

      it 'categoryが空では保存できない' do
        @task.category_id = ''
        @task.valid?
        expect(@task.errors.full_messages).to include "タスクの種類を選択してください"

      end
      it 'categoryが1では保存できない' do
        @task.category_id = 1
        @task.valid?
        expect(@task.errors.full_messages).to include "タスクの種類を選択してください"

      end
      it 'conditionが空では保存できない' do
        @task.condition_id = ''
        @task.valid?
        expect(@task.errors.full_messages).to include "タスクの状態を選択してください"

      end
      it 'conditionが1では保存できない' do
        @task.condition_id = ''
        @task.valid?
        expect(@task.errors.full_messages).to include "タスクの状態を選択してください"

      end

      it 'explanationが空では保存できない' do
        @task.explanation = ''
        @task.valid?
        expect(@task.errors.full_messages).to include "タスクの説明を入力してください"
      end

      it 'userが紐付いていないと保存できない' do
        @task.user_ids = nil
        @task.valid?
        expect(@task.errors.full_messages).to include "タスクの参加者を入力してください"
      end
    end
  end
end
