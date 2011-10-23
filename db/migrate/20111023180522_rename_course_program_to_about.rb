class RenameCourseProgramToAbout < ActiveRecord::Migration
  def change
    rename_column :courses, :program, :about
  end
end
