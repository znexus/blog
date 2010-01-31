class AddUserIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :email
    add_index :users, :confirmation_token    # for confirmable
    add_index :users, :reset_password_token  # for recoverable
  end

  def self.down
    drop_index :users, :email
    drop_index :users, :confirmation_token    # for confirmable
    drop_index :users, :reset_password_token  # for recoverable

  end
end
