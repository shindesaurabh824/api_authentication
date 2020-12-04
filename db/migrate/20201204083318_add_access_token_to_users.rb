class AddAccessTokenToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :access_token, :string
  end

  def down
    remove_column :users, :access_token
  end
end
