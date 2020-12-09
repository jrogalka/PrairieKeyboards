class CartController < ApplicationController
  def create
    id = params[:id]
    quantity = params[:quantity]
    new_item = { id: id, quantity: quantity }
    product = Product.find(id)

    unless session[:shopping_cart].any? { |hash| hash["id"] == id }
      session[:shopping_cart] << new_item
      flash[:notice] = "#{product.name} added to cart."
    end

    redirect_to root_path
  end

  # DELETE /cart/:id
  def destroy
    id = params[:id]
    session[:shopping_cart].delete_if { |hash| hash["id"] == id }
    product = Product.find(id)

    flash[:notice] = "#{product.name} removed from cart."

    redirect_to "/cart/show"
  end

  def show
    @cart_contents = session[:shopping_cart]
    add_breadcrumb "Cart", cart_path
  end

  def update
    id = params[:id]
    quantity = params[:quantity]
    product = session[:shopping_cart].find { |p| p["id"] == id }
    product["quantity"] = quantity
    flash[:notice] = "#{Product.find(id).name} Quantity updated. (#{quantity})"

    redirect_to "/cart/show"
  end
end
