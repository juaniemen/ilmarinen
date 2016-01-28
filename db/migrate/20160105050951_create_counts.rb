class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.string :question
      t.string :option
      t.integer :optionCount

      t.timestamps null: false
    end
  end
end
