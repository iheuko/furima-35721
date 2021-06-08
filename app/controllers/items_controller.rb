class ItemsController < ApplicationController
  before_action :redirect_sign_up, only: [:new]
  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end  
  end
end


private

def item_params
  params.require(:item).permit(:item_name, :message, :price, :category_id, :item_status_id, :burden_id, :state_id, :shipping_day_id, :image).merge(user_id: current_user.id)
end

def redirect_sign_up
  unless user_signed_in?
    redirect_to new_user_registration_path
  end  
end