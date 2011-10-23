class Enrollment < ActiveRecord::Base
  def self.verified(course)
    where(:verified => true, course_id: course.id)
  end

  belongs_to :student
  belongs_to :course
end
