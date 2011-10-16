class CreateCoursesLecturers < ActiveRecord::Migration
  def up
    create_table :courses_lecturers do |t|
      t.integer :course_id
      t.integer :lecturer_id

      t.timestamps
    end
  end

  def down
    drop_table :courses_lecturers
  end
end
