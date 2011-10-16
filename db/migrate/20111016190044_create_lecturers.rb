class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :occupation
      t.string :affiliation
      t.text :about

      t.timestamps
    end
  end
end
