class LikesController < ApplicationController
    def create
      shop = Shop.find params[:shop_id]
      current_user.like(shop)
      redirect_to shops_path, success: 'liked shop.'
    end
  
    def destroy
      shop = Shop.find params[:shop_id]
      current_user.unlike(shop)
      redirect_to shops_path, success: 'unliked shop.'
    end
  end