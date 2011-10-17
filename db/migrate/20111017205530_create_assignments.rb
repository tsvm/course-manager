class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :topic_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
