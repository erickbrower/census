class AddLetterToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :letter, :char
  end
end
