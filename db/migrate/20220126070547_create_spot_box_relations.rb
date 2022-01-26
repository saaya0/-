class CreateSpotBoxRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_box_relations do |t|
      t.references :spot, foreign_key: true
      t.references :box, foreign_key: true

      t.timestamps
    end
  end
end
