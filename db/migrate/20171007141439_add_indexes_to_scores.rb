class AddIndexesToScores < ActiveRecord::Migration[5.1]
  def change
    add_index :scores, :user_id
    add_index :scores, :assignment_id
  end
end
