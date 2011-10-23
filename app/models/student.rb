class Student < ActiveRecord::Base
  has_many :enrollments, :dependent => :delete_all

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name

  TOKEN = "InRailsWeTrust"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true

  def self.exists?(email)
    find_by_email(email)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def digest
    Digest::SHA2.hexdigest(TOKEN + created_at.to_s +
                           first_name + last_name + email)
  end

  def enrolled_for_course?(course)
    enrollment = Enrollment.find_by_course_id_and_student_id(course.id, id)
    enrollment.verified? unless enrollment.nil?
  end

  def has_pending_enrollment_for_course?(course)
    enrollment = Enrollment.find_by_course_id_and_student_id(course.id, id)
    enrollment.verified? == false unless enrollment.nil?
  end

  def sent_solution_for_assignment?(assignment)
    Solution.find_by_assignment_id_and_student_id(assignment.id, id)
  end

  def verified_enrollments
    Enrollment.find_all_by_student_id_and_verified(id, true)
  end
end
