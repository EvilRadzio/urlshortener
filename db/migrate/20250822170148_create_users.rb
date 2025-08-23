class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.integer :api_key

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users. :api_key, unique: true
  end
end
