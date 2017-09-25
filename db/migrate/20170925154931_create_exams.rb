class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
