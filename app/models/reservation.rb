class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :course
  with_options presence: true do
    validates :allergies
    validates :place
    validates :guasts, format: { with: /\A[0-9]+\z/, message: '半角数字で入力して下さい' }
    validates :user_phone_number, format: { with: /\A\d{11}\z/, message: '11桁の半角数字で入力してください' } 
  end
end