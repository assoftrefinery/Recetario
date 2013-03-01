class CreateReceta < ActiveRecord::Migration
  def change
    create_table :receta do |t|
      t.string :autor
      t.string :nombre
      t.text :ingredientes
      t.text :preparacion
      t.string :inventor
      t.integer :user_id

      t.timestamps
    end
  end
end
