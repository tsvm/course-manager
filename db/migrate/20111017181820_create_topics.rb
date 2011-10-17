class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.datetime :date
      t.integer :course_id
      t.text :content

      t.timestamps
    end
  end
end
