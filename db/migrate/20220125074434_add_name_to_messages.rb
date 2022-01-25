class AddNameToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :name, :string
    add_column :messages, :email, :string
    add_column :messages, :message, :string
  end
end
