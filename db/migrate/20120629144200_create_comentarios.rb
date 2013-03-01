class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :autor
      t.text :cuerpo
      t.references :receta

      t.timestamps
    end
    add_index :comentarios, :recetum_id
  end
end
