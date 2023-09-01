require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe 'タスク登録' do
    context 'タスク登録できる場合' do
      it 'title、start_time、end_time、category、condition、explanationが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
    end
    context 'タスク登録できない場合' do
      it 'titleが空では保存できない' do
    
      end
      it 'start_timeが空では保存できない' do

      end
      it 'end_timeが空では保存できない' do

      end
      it 'start_timeよりend_timeが早い場合は保存できない' do

      end

      it 'categoryが空では保存できない' do

      end
      it 'categoryが1では保存できない' do

      end
      it 'conditionが空では保存できない' do

      end
      it 'conditionが1では保存できない' do

      end

      it 'explanationが空では保存できない' do

      end

      it 'userが紐付いていないと保存できない' do

      end


    end
  end
end
