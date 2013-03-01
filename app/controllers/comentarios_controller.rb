class ComentariosController < ApplicationController
  before_filter :login_required

    # create a comment and bind it to an article and a user
    def create
      @recetum = Recetum.find(params[:id])
      @comentario = @recetum.comentarios.build(params[:comentario])
      @comentario.user_id = current_user.id

      respond_to do |format|
        if @recetum.state > 2
          if @comentario.save
            format.html { redirect_to(@recetum, :notice => 'Comment was successfully created.') }
          else
            format.html { redirect_to(@recetum, :notice => 'There was an error saving your comment (empty comment or comment way to long).') }
          end
        else
          format.html { redirect_to(@recetum, :notice => 'Comments are limited to published articles.') }
        end
      end
    end

    # remove a comment
    def destroy
      @comentario = current_user.comments.find(params[:id])
      @recetum = Recetum.find(params[:id])
      @comentario.destroy

      respond_to do |format|
        format.html { redirect_to @recetum }
      end
    end
  end
