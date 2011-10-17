class Assignment < ActiveRecord::Base
  belongs_to :topic
  has_many :resources, :as => :resource_container
  has_many :solutions

  validates :title, presence: true
  validates :description, presence: true
end
