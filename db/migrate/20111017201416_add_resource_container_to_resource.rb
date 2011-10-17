class AddResourceContainerToResource < ActiveRecord::Migration
  def change
    add_column :resources, :resource_container_id, :integer
    add_column :resources, :resource_container_type, :string
  end
end
