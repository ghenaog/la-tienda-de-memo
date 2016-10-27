class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [ :edit, :update, :show, :destroy ]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'The product has been saved'
      redirect_to product_path(id: @product.id, it_was: 'created')
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @product.update(product_params)
      flash[:notice] = 'Product was succesfully updated'
      redirect_to product_path(id: @product.id, it_was: 'updated')
    else
      render :edit
    end
  end

  def index
    @products = Product.all
  end

  def destroy
      @product.destroy
    flash[:notice] = 'Product was successfully destroyed'
    redirect_to products_path
  end

  def show
    @action = params[:it_was]
  end

  private

    def product_params
      params.require(:product).permit(:name, :reference, :price, :quantity, :brand, :description, :category_id)
    end

    def find_product
      @product = Product.find(params[:id])
    end
end
