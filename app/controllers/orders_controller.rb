class OrdersController < ApplicationController
  def index
    @user = User.find(current_user)
  	@current_truck = Truck.find(params[:truck_id])
  	# Must make this a helper method
  	@truck_orders = @current_truck.orders.all   
  end

  def show
  	@current_truck = Truck.find(params[:truck_id])
  	@order = Order.find(params[:id])
  end

  def new
  	@current_truck = Truck.find(params[:truck_id])
  	@order = @current_truck.orders.new
  end

  def create
  	@current_truck = Truck.find(params[:truck_id])
  	@order = @current_truck.orders.build(order_params)
  	if @order.save 
  		redirect_to truck_orders_path
  	else
  		render 'new'
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
  	params.require(:order).permit(:user_id,:truck_id,:item1,:item2,:item3,:item4,:item5,:item6,:item7,:item8,:item9,:item10, :latitude, :longitude)
  end
end
