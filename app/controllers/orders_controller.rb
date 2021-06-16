class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  before_action :redirect_root

  def index
    @order_residence = OrderResidence.new
  end

  def create
    @order_residence = OrderResidence.new(order_params)
    if @order_residence.valid?
      pay_item
      @order_residence.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_residence).permit(:postal_code, :state_id, :city, :address_line, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],    
      currency: 'jpy' 
    )
  end

  def redirect_root
    if @item.user_id == current_user.id || !@item.order.nil?
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
