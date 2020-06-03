class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  def index
    @products = Product.all.order("created_at DESC").limit(6)
    @images = Image.all.includes(:item)
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "出品しました"
    else
      render :new, notice: "出品できませんでした"
    end
  end

  def show
  end
  
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path(@product.id), notice: '商品を編集しました'
    else
      redirect_to edit_product_path, notice: '商品を編集できませんでした'
    end
  end

  
  def destroy
    if @product.destroy
      redirect_to root_path, notice: '商品を削除しました'
    else
      redirect_to root_path, notice: '商品を削除できませんでした'
    end
  end

  
  private
  
  def product_params
    params.require(:product).permit(:name, :description, :brand, :status, :send_fee, :region_id, :category_id, :send_day, :price, images_attributes: [:src, :_destroy, :id]).merge(buy_user_id: "0")
  end
  
  def set_product
    @product = Product.find(params[:id])
  end
end
