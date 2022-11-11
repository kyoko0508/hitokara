class LikesController < ApplicationController
  def create
    shop = Shop.find params[:shop_id]
    current_user.like(shop)
    redirect_to shops_path
  end
  
  def destroy
    shop = Shop.find params[:shop_id]
    current_user.unlike(shop)
    redirect_to shops_path
  end

  def show
    @liked_shops = current_user.liked_shops
  end
end