class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    end
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :description, :brand, :status, :send_fee, :region_id, :send_day, :price, images_attributes: [:src])
  end
end
