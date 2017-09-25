class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :exam_id
      t.boolean :correct

      t.timestamps
    end
  end
end
