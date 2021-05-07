class Course < ApplicationRecord
  belongs_to :chef
  has_many_attached :course_images
  with_options presence: true do
    validates :course_title
    validates :description
    validates :price
    validates :start_datetime
    validates :end_datetime
    validates :course_images
    end
    validate :start_check
    validate :start_end_check
  
  
  def start_check
     unless start_datetime == nil 
            errors.add(:start_datetime, "は現在の日時より遅い時間を選択してください") if self.start_datetime < DateTime.now
    end
  end

  def start_end_check
    unless end_datetime == nil 
      errors.add(:end_datetime, "は開始時刻より遅い時間を選択してください") if self.start_datetime > self.end_datetime
    end
  end
  
end

