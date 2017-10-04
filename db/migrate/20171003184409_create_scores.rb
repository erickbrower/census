class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :assignment_id
      t.integer :student_id
      t.float :score

      t.timestamps
    end
  end
end
