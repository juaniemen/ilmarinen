class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :cp

      t.timestamps null: false
    end
  end
end
