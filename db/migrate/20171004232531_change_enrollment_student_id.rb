class ChangeEnrollmentStudentId < ActiveRecord::Migration[5.1]
  def change
    remove_column :enrollments, :student_id
    add_column :enrollments, :user_id, :integer
  end
end
