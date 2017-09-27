class DropExamIdFromAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :exam_id
    add_column :answers, :question_id, :integer
  end
end
