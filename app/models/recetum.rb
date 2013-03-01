class Recetum < ActiveRecord::Base
  has_many :comentarios, :dependent => :destroy
  attr_accessible :autor, :ingredientes, :inventor, :nombre, :preparacion, :user_id, :id


  validates_presence_of :autor , :message => ": No puedes dejar este campo en blanco"
  validates_presence_of :ingredientes , :message => ": Sin ingredientes no hay comida!"
  validates_presence_of :nombre , :message => ": Como se llama la receta?"
  validates_presence_of :preparacion , :message => ": Oye! No me has dicho como preparar la receta"
end
