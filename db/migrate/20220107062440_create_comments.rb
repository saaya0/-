class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.string :comment, null: false
      t.string :comment_img

      t.timestamps
    end
  end
end
