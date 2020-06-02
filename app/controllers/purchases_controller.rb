class PurchasesController < ApplicationController

  def index
    @product=Product.all
  end
end