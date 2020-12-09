class CartController < ApplicationController
  # POST /cart
  # Data sent as form data, ends up in the params hash
  def create
    # Add params[:id] to cart
    id = params[:id].to_i
    quantity = params[:quantity].to_i
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
    # Remove the specified item from the cart.
    id = params[:id].to_i
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
    id = params[:id].to_i
    quantity = params[:quantity].to_i
    puts session[:shopping_cart]

    p = session[:shopping_cart].find { |p| p["id"] == id }
    p["quantity"] = quantity

    redirect_to "/cart/show"
  end
end
