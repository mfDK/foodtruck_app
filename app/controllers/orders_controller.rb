class OrdersController < ApplicationController
  def index
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
<<<<<<< HEAD
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
=======
  	@current_truck = Truck.find(params[:truck_id])
  	@order = @current_truck.orders.build(order_params)
  	if @order.save 
  		redirect_to truck_orders_path(@current_truck)
>>>>>>> 507448d1ad6231f6d132acc4674022653856ead4
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
  	params.require(:order).permit(:user_id,:truck_id,:item1,:item2,:item3,:item4,:item5,:item6,:item7,:item8,:item9,:item10)
  end
end
