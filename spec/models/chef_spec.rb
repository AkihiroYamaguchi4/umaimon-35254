require 'rails_helper'

RSpec.describe Chef, type: :model do
  before do
    @chef = FactoryBot.build(:chef)
    sleep(0.3)
  end
  context 'シェフ登録ができる時' do
    it 'ニックネーム,メールアドレス,本名の苗字と氏名,生年月日,passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@chef).to be_valid
    end
    it 'パスワードは、半角英数字を含む6文字以上での入力が必須であること' do
      @chef.password = '1234ab'
      @chef.password_confirmation = '1234ab'
      expect(@chef).to be_valid
    end
  end
  context 'シェフ登録ができない時' do
    it 'ニックネームが空では登録できないこと' do
      @chef.chef_nickname = ''
      @chef.valid?
      expect(@chef.errors.full_messages).to include("Chef nickname can't be blank")
    end

    it 'emailが必須であること' do
      @chef.email = ''
      @chef.valid?
      expect(@chef.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは、@を含む必要があること' do
      @chef.email = 'test.com'
      @chef.valid?
      expect(@chef.errors.full_messages).to include('Email is invalid')
    end

    it 'emailが一意性であること' do
      @chef.save
      another_chef = FactoryBot.build(:chef, email: @chef.email)
      another_chef.valid?
      expect(another_chef.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが必須であること' do
      @chef.password = ''
      @chef.valid?
      expect(@chef.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが半角英数字を含む5文字以下であれば登録できないこと' do
      @chef.password = '123ab'
      @chef.password_confirmation = '123ab'
      @chef.valid?
      expect(@chef.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは英語のみでは登録できないこと' do
      @chef.password = 'abcdef'
      @chef.password_confirmation = 'abcdef'
      @chef.valid?
      expect(@chef.errors.full_messages).to include('Password パスワードには半角英字と半角数字の両方を含めて設定してください')
    end
    it 'passwordは数字のみでは登録できないこと' do
      @chef.password = '123456'
      @chef.password_confirmation = '123456'
      @chef.valid?
      expect(@chef.errors.full_messages).to include('Password パスワードには半角英字と半角数字の両方を含めて設定してください')
    end
    it 'passwordは全角では登録できないこと' do
      @chef.password = 'ああああああ'
      @chef.password_confirmation = 'ああああああ'
      @chef.valid?
      expect(@chef.errors.full_messages).to include('Password パスワードには半角英字と半角数字の両方を含めて設定してください')
    end

    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @chef.password = '1234ab'
      @chef.password_confirmation = '12345ab'
      @chef.valid?
      expect(@chef.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名は、名字が必須であること' do
      @chef.chef_family_name = ''
      @chef.valid?
      expect(@chef.errors.full_messages).to include("Chef family name can't be blank")
    end
    it 'ユーザー本名は、名前が必須であること' do
      @chef.chef_first_name = ''
      @chef.valid?
      expect(@chef.errors.full_messages).to include("Chef first name can't be blank")
    end

    it 'ユーザー本名は、名字は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @chef.chef_family_name = 'aaaa'
      @chef.valid?
      expect(@chef.errors.full_messages).to include('Chef family name 全角ひらがな、全角カタカナ、漢字で入力して下さい')
    end

    it 'ユーザー本名は、名前は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @chef.chef_first_name = 'aaaa'
      @chef.valid?
      expect(@chef.errors.full_messages).to include('Chef first name 全角ひらがな、全角カタカナ、漢字で入力して下さい')
    end

    it '生年月日が必須であること' do
      @chef.chef_birth_id = ''
      @chef.valid?
      expect(@chef.errors.full_messages).to include("Chef birth can't be blank")
    end
  end

end
