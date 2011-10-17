class Resource < ActiveRecord::Base
  belongs_to :resource_container, polymorphic: true

  validates :name, presence: true
  validates :resource_file, presence: true

  mount_uploader :resource_file, ResourceFileUploader
end
