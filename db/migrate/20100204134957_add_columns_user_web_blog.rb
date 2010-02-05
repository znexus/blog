class AddColumnsUserWebBlog < ActiveRecord::Migration
  def self.up
    add_column :users, :web, :string
    add_column :users, :blogger, :boolean
    add_column :users, :blog, :string
  end

  def self.down
    remove_column :users, :web
    remove_column :users, :blogger
    remove_column :users, :blog
  end
end
