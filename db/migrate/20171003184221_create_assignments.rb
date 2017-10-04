class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.integer :course_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
