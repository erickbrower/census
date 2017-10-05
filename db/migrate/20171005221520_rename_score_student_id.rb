class RenameScoreStudentId < ActiveRecord::Migration[5.1]
  def change
    rename_column :scores, :student_id, :user_id
  end
end
