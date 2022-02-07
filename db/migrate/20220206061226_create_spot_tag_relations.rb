class CreateSpotTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_tag_relations do |t|
      t.integer :spot_id, foreign_key: true
      t.integer :tag_id, foreign_key: true

      t.timestamps
    end
  end
end
