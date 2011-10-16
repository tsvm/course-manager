class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :course_id
      t.integer :student_id
      t.boolean :verified

      t.timestamps
    end
  end
end
