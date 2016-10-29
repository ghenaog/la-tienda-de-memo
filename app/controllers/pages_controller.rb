class PagesController < ApplicationController
  def home
    @categories = Category.all
    if params[:category_id].present?
      @products = Category.find(params[:category_id]).products
    else
      @products = Product.all.shuffle[0..5]
    end
  end
end
