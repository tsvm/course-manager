class ChangeCourseStartEndDates < ActiveRecord::Migration
  def change
    change_column :courses, :start_date, :date
    change_column :courses, :end_date, :date
  end
end
