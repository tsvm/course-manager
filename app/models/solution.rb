class Solution < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student
  has_many :solution_resources, class_name: 'Resource', :as => :resource_container
  accepts_nested_attributes_for :solution_resources
end
