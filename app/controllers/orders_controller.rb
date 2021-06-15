class OrdersController < ApplicationController
  before_action :redirect_root
  def index
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new
  end

  def create
    @order_residence = OrderResidence.new(order_params)
    if @order_residence.valid?
      pay_item
      @order_residence.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end


  private

  def order_params
    params.require(:order_residence).permit(:postal_code, :state_id, :city, :address_line, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price, 
      card: order_params[:token],    
      currency: 'jpy' 
    )
  end

  def redirect_root
    item = Item.find(params[:item_id])
    if !user_signed_in?
      redirect_to root_path

    elsif item.order.nil?
      redirect_to root_path
    end
  end
end
