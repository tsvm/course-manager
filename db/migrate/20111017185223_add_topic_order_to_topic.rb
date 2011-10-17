class AddTopicOrderToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :topic_order, :integer
  end
end
