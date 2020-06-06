class PurchasesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def  done
    @product_purchaser= Product.find(params[:id])
    @product_purchaser.update( buy_user_id: current_user.id)
   end
end