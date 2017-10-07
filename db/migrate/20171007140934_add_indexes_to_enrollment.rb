class AddIndexesToEnrollment < ActiveRecord::Migration[5.1]
  def change
    add_index :enrollments, :user_id
    add_index :enrollments, :course_id
  end
end
