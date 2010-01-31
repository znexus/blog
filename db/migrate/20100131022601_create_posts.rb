class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :titulo
      t.string :resumen
      t.text :texto
      t.integer :user_id
      t.integer :categoria_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :posts
  end
end
