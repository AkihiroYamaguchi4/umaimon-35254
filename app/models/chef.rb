class Chef < ApplicationRecord
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
          validates :chef_nickname
          validates :chef_birth_id
          validates :chef_career
          validates :belong
          validates :chef_phone_number, format: { with: /\A\d{11}\z/, message: '11桁の半角数字で入力してください' }
          with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' } do
            validates :chef_family_name
            validates :chef_first_name
          end
        end
 end