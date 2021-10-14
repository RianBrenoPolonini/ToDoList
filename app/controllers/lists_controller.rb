class ListsController < ApplicationController
  include SessionsHelper

  before_action :authorize
  before_action :set_list, only: %i[ show edit update destroy ]
 
  # GET /lists or /lists.json
  def index
    @lists = current_user.lists
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = current_user.lists.build(list_params)

    if current_user.lists.length > 5
      flash[:danger] = 'Você pode cadastrar no máximo 5 listas de tarefas'
      redirect_to lists_path 
    else
      if @list.save
        flash[:success] = 'Lista cadastrada com sucesso!'
        redirect_to lists_path
      else
        render 'new'
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    if @list.update(list_params)
      flash[:success] = 'Lista alterada com sucesso!'
      redirect_to lists_path
    else
      render 'new'
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy
    flash[:success] = 'Lista apagada com sucesso!'
    redirect_to lists_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = current_user.lists.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name)
    end
end
