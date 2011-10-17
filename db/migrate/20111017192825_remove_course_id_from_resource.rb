class RemoveCourseIdFromResource < ActiveRecord::Migration
  def up
    remove_column :resources, :course_id
  end

  def down
    add_column :resources, :course_id, :integer
  end
end
