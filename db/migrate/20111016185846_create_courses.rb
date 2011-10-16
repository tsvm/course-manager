class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :poster
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.string :map
      t.text :program
      t.integer :capacity
      t.string :audience
      t.string :registration_notice

      t.timestamps
    end
  end
end
