class CreatePollRecs < ActiveRecord::Migration
  def change
    create_table :poll_recs do |t|
      t.string :name
      t.timestamp :lastModification

      t.timestamps null: false
    end
  end
end
