class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :description
      t.string :resource_file
      t.integer :course_id

      t.timestamps
    end
  end
end
