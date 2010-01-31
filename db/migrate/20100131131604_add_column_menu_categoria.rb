class AddColumnMenuCategoria < ActiveRecord::Migration
  def self.up
    add_column :categorias, :menu, :boolean, :default => false
  end

  def self.down
    remove_column :categorias, :menu
  end
end
