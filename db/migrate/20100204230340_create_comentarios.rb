class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.text :texto
      t.string :nombre
      t.string :email
      t.string :web
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :comentarios
  end
end
