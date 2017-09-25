class CreateSittings < ActiveRecord::Migration[5.1]
  def change
    create_table :sittings do |t|
      t.integer :user_id
      t.integer :exam_id

      t.timestamps
    end
  end
end
