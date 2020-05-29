class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show]
  def index
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :description, :brand, :status, :send_fee, :region_id, :send_day, :price, images_attributes: [:src])
  end

  def show
  end
  
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children

  def edit
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to action: :index
    else
      render :edit(product.id), notice:"出品情報の更新に失敗しました。"
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
