class ChangeApiKeyToStringInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :api_key, :string
  end
end
