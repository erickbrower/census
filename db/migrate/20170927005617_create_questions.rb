class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :exam_id

      t.timestamps
    end
  end
end
