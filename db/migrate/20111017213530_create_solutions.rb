class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :assignment_id
      t.integer :student_id
      t.text :comment

      t.timestamps
    end
  end
end
