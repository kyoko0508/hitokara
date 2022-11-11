class ShopsController < ApplicationController

  def index
    @shops = Shop.all
    
  end

  def likes
    @liked_shops = current_user.liked_shops
  end
end
