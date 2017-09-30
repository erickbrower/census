class AddNumberToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :number, :integer
  end
end
