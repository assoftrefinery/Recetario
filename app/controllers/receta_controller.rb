class RecetaController < ApplicationController
  # GET /receta
  # GET /receta.json
  def index
    @receta = Recetum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receta }
    end
  end

  # GET /receta/1
  # GET /receta/1.json
  def show
    @recetum = Recetum.find(params[:id])
    @comentarios = @recetum.comentarios.all
    #@comentario = Comentario.new( :recetum => @recetum )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recetum }
    end
  end

  # GET /receta/new
  # GET /receta/new.json
  def new
    @recetum = Recetum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recetum }
    end
  end

  # GET /receta/1/edit
  def edit
    @recetum = Recetum.find(params[:id])
  end

  # POST /receta
  # POST /receta.json
  def create
    @recetum = Recetum.new(params[:recetum])
    @recetum.user_id = current_user.id

    respond_to do |format|
      if @recetum.save
        format.html { redirect_to @recetum, notice: 'La receta se ha creado con exito.' }
        format.json { render json: @recetum, status: :created, location: @recetum }
      else
        format.html { render action: "new" }
        format.json { render json: @recetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /receta/1
  # PUT /receta/1.json
  def update
    @recetum = Recetum.find(params[:id])

    respond_to do |format|
      if @recetum.update_attributes(params[:recetum])
        format.html { redirect_to @recetum, notice: 'La receta ha sido actualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receta/1
  # DELETE /receta/1.json
  def destroy
    @recetum = Recetum.find(params[:id])
    @recetum.destroy

    respond_to do |format|
      format.html { redirect_to receta_url }
      format.json { head :no_content }
    end
  end
end
