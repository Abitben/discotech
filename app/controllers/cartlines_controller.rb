class CartlinesController < ApplicationController

def create
    # Find associated album and current cart
    chosen_ad = Ad.find(params[:ad_id])
    current_cart = @current_cart

    # If cart already has this album then find the relevant cartline and iterate quantity otherwise create a new cartline for this album
    if current_cart.ads.include?(chosen_ad)
      # Find the cartline with the chosen_album
      @cartline = current_cart.cartlines.find_by(:ad_id => chosen_ad)
      # Iterate the cartline's quantity by one
    else
      @cartline = Cartline.new
      @cartline.cart = current_cart
      @cartline.ad = chosen_ad
    end
  
    # Save and redirect to cart show path
    @cartline.save!
    redirect_to cart_path(current_cart)
end

  def destroy
    @cartline = Cartline.find(params[:id])
    @cartline.destroy
    redirect_to cart_path(@current_cart)
  end  
  
    private
    
    def cartline_params
        params.require(:cartline).permit(:ad_id, :cart_id)
    end

end