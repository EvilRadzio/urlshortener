class RecreateApiKeyColumnInUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :api_key
    add_column :users, :api_key, :string
  end
end
