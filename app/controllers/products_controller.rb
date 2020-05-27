class ProductsController < ApplicationController
  def index
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
  end
end
