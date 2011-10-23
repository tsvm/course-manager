class Solution < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student
  has_many :resources, :as => :resource_container
  accepts_nested_attributes_for :resources
end
