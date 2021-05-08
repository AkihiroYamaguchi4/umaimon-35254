require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    chef = FactoryBot.create(:chef)
    @course = FactoryBot.build(:course, chef_id: chef.id)
   
    sleep(0.3)
  end
  context 'コースが登録ができる時' do
    it 'タイトル、コース説明、金額、画像、開始時間、終了時間が存在すれば登録できること' do
      expect(@course).to be_valid
    end
  end
  
  context 'コースが登録ができない時' do
    it 'タイトルが空では登録できないこと' do
      @course.course_title = ''
      @course.valid?
      expect(@course.errors.full_messages).to include("Course title can't be blank")
    end

    it 'コース説明が必須であること' do
      @course.description = ''
      @course.valid?
      expect(@course.errors.full_messages).to include("Description can't be blank")
    end
    
    it '金額が必須であること' do
      @course.price = ''
      @course.valid?
      expect(@course.errors.full_messages).to include("Price can't be blank")
    end
   
    it '金額が全角数字だと投稿できないこと' do
      @course.price = '２９９'
      @course.valid?
      expect(@course.errors.full_messages).to include('Price 半角数字で入力して下さい')
    end
    it '金額が全角英語だと投稿できないこと' do
      @course.price = 'TTT'
      @course.valid?
      expect(@course.errors.full_messages).to include('Price 半角数字で入力して下さい')
    end 
     
    it '開始時刻が必須であること' do
      @course.start_datetime = 'nil'
      @course.valid?
      expect(@course.errors.full_messages).to include("Start datetime can't be blank")
    end
    it '開始時刻が過去の時刻だと投稿できないこと' do
      @course.start_datetime = ''
      @course.valid?
      expect(@course.errors.full_messages).to include("開始時刻は現在の日時より遅い時間を選択してください")
    end
    it '終了時刻が必須であること' do
      @course.start_datetime = ''
      @course.valid?
      expect(@course.errors.full_messages).to include("End daytime can't be blank")
    end
    it '終了時刻が開始時刻より早い時刻だと投稿できないこと' do
      @course.start_datetime = ''
      @course.valid?
      expect(@course.errors.full_messages).to include("終了時刻は開始時刻より遅い時間を選択してください")
    end
    it 'chefが紐付いていないと保存できないこと' do
      @course.chef = nil
      @course.valid?
      expect(@course.errors.full_messages).to include('Chef must exist')
    end
  end

end
