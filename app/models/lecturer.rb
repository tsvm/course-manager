class Lecturer < ActiveRecord::Base
  default_scope :order => 'first_name, last_name'

  has_and_belongs_to_many :courses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :photo, presence: true
  validates :occupation, presence: true
  validates :affiliation, presence: true
  validates :about, presence: true

  mount_uploader :photo, LecturerPhotoUploader

  def name
    "#{first_name} #{last_name}"
  end

  def info
    "#{occupation}, #{affiliation}"
  end

  def to_s
    name
  end
end
