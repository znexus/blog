class AddNombreNickUser < ActiveRecord::Migration
  def self.up
    add_column :users, :nombre, :string
    add_column :users, :nick, :string
  end

  def self.down
    remove_column :users, :nombre
    remove_column :users, :nick
  end
end
