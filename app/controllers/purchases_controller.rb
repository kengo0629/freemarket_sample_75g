class PurchasesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def  done
    @product= Product.find(params[:id])
    @product.update( buy_user_id: current_user.id)
   end
end