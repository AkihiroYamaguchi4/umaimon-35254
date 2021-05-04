class Course < ApplicationRecord
  belongs_to :chef
  has_many_attached :course_images
  with_options presence: true do
  validates :course_title
  validates :description
  validates :price
  validates :start_date
  validates :end_date
  end
end
