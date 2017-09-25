class AddScoreToSitting < ActiveRecord::Migration[5.1]
  def change
    add_column :sittings, :score, :float
  end
end
