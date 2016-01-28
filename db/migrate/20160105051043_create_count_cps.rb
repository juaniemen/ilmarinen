class CreateCountCps < ActiveRecord::Migration
  def change
    create_table :count_cps do |t|
      t.integer :cp

      t.timestamps null: false
    end
  end
end
