class CreateGeneralCounts < ActiveRecord::Migration
  def change
    create_table :general_counts do |t|

      t.timestamps null: false
    end
  end
end
