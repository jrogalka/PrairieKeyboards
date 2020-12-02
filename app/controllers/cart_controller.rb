class CartController < ApplicationController
  # POST /cart
  # Data sent as form data, ends up in the params hash
  def create
    # Add params[:id] to cart
    console

    id = params[:id].to_i
    quantity = params[:quantity].to_i
    new_item = { id: id, quantity: quantity }

    unless session[:shopping_cart].any? { |hash| hash["id"] == id }
      session[:shopping_cart] << new_item
      flash[:notice] = "#{product.name} added to cart."
    end

    puts session[:shopping_cart]

    redirect_to root_path
  end

  # DELETE /cart/:id
  def destroy
    # Remove the specified item from the cart.
    id = params[:id].to_i
    session[:shopping_cart].delete(id)

    flash[:notice] = "#{product.name} removed from cart."

    redirect_to root_path
  end
end