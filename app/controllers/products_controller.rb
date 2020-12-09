class ProductsController < ApplicationController
  def index
    @products = Product.all.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
    add_breadcrumb @product.category.name, @product.category
    add_breadcrumb @product.name, @product
  end

  def search
    if params[:category]["category_id"] == ""
      @products = Product.where("name LIKE ?", "%#{params[:search_term]}%").page params[:page]
    else
      @products = Product.where("name LIKE ? AND category_id = ?", "%#{params[:search_term]}%",
                                params[:category]["category_id"].to_s).page params[:page]
    end
    @categories = Category.all
  end
end
