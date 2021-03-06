class Course < ActiveRecord::Base
  has_and_belongs_to_many :lecturers
  has_many :enrollments, :dependent => :delete_all
  has_many :resources, :as => :resource_container, :dependent => :delete_all
  has_many :topics, :dependent => :delete_all

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
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

  def self.current
    where('start_date <= ? AND end_date >= ?', Date.today, Date.today)
  end
end
