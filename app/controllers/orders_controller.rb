class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new
  end

  def create
    @order_residence = OrderResidence.new(order_params)
    if @order_residence = valid?
      @order_residence.save
      redirect_to items: :index
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end


  private

  def order_params
    params.require(:order_residence).permit(:postal_code, :state_id, :city, :address_line, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:id])
  end
end
