class Topic < ActiveRecord::Base
  default_scope :order => :topic_order

  belongs_to :course
  has_many :resources, :as => :resource_container
  has_many :assignments

  validates :topic_order, presence: true
  validates :title, presence: true
  validates :date, presence: true
  validates :course, presence: true
  validates :content, presence: true
end
