class Comentario < ActiveRecord::Base
  belongs_to :user
  belongs_to :receta
  attr_accessible :autor, :cuerpo, :recetum_id, :user_id, :id
end
