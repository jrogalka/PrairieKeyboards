class ProductsController < ApplicationController
  def index
    @products = Product.all.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where("name LIKE '%#{params[:search_term]}%'").page params[:page]
  end
end
