class CartController < ApplicationController
  # POST /cart
  # Data sent as form data, ends up in the params hash
  def create
    # Add params[:id] to cart
    console

    id = params[:id].to_i
    quantity = params[:quantity].to_i
    new_item = { id: id, quantity: quantity }

    session[:shopping_cart] << new_item

    redirect_to root_path
  end

  # DELETE /cart/:id
  def destroy
    # Remove params[:id] from cart
    i = 0
  end
end
