class OrdersController < ApplicationController
  def index
  end

  def show
  	@order = Order.where(user_id: current_user,id: params[:id]).first
  end

  def new
  	@order = current_user.orders.new
  end

  def create
    @truck= Truck.find(params[:id])
  	@order = current_user.orders.build(order_params)
    if Geocoder::Calculations.distance_between([current_user.latitude,current_user.longitude], [@truck.latitude, @truck.longitude], :mi) < 2
    else
      flash[:alert] = "You're out of delivery range."
      render :new
    end
  	if @order.save
  		flash[:notice] = "Your Order was created!"
  		redirect_to user_order_path(current_user,params[:id])
  	else
  		redirect_to new_user_order_path
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def order_params
  	params.require(:user).permit(:user_id,:truck_id,:item1,:item2,:item3,:item4,:item5,:item6,:item7,:item8,:item9,:item10)
  end
end
