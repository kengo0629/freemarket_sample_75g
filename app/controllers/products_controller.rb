class ProductsController < ApplicationController
  def index
  end

  def edit
  @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    Product.update(product_params)
    redirect_to action: :index
  end
end
