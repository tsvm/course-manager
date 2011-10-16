class Course < ActiveRecord::Base
  has_and_belongs_to_many :lecturers

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  validates :program, presence: true
  validates :audience, presence: true

  mount_uploader :map, CourseMapUploader
  mount_uploader :poster, CoursePosterUploader

  def sold_out?
    if capacity
      Enrollment.verified(self).count >= capacity
    else
      false
    end
  end

  def expired?
    end_date < Date.today
  end
end
