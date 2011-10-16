class Student < ActiveRecord::Base
  has_many :enrollments
  has_many :courses, through: :enrollments

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

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
    courses.find_index(course)
  end
end
