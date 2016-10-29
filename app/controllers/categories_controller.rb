class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only: [ :edit, :update, :show, :destroy ]
  before_action :its_admin?

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'The category has been saved'
      redirect_to category_path(id: @category.id, it_was: 'created')
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @category.update(category_params)
        flash[:notice] = 'Category was succesfully updated'
        redirect_to category_path(id: @category.id, it_was: 'updated')
      else
        render :edit
      end
  end

  def show
    @action = params[:it_was]
  end

  def destroy
    @category.destroy
  flash[:notice] = 'Category was successfully destroyed'
  redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  private

    def category_params
      params.require(:category).permit(:name, :description)
    end

    def find_category
      @category = Category.find(params[:id])
    end

    def its_admin?
      unless current_user.admin?
        redirect_to root_path, :alert => "Acceso denegado, no posee permisos como administrador"
      end
    end
end
