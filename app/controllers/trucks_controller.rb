class TrucksController < ApplicationController
  def index
    @all_trucks = Truck.all
    if logged_in?
      # If a user a logged in, these instance variables are available
      @user = User.find(current_user)
      @my_trucks = Truck.where(user_id: current_user)
      # @my_trucks is an instance variable used by the logged in user that is a truck owner. The truck owner check is in the view. 
    else
      @all_trucks = Truck.all
    end
  end

  def show
    @truck = Truck.find(params[:id])
    @foods = Food.where(truck_id: params[:id]).all
    # This gets the foods that pertain to the truck
    @current_truck = Truck.find(params[:id])
    @order = @current_truck.orders.new
    # This @order instance variable creates an order that that will find truck that pertains to the truck
    @user = User.find(current_user)
  end

  def new
    @truck = Truck.new
  end

  def create
    # This create has to be deprecated because a user that is a truck owner should not be able to create a truck. Only Admins should be able to create trucks. 
    @truck = Truck.new(truck_params)
    if @truck.save
      flash[:notice] = "Congratulation on registering your truck"
      redirect_to @truck 
    else
      flash[:alert] = "Your truck was not created"
      redirect_to new_truck_path
    end
  end

  def edit
    # This link is in the trucks/show view
    @truck = Truck.find(params[:id])
  end

  def update
    @truck = Truck.find(params[:id])
    @truck.update(truck_params)
    @truck.save
    flash[:notice] = "You Truck has been edited!"
    redirect_to @truck
  end

  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy
    redirect_to user_path(current_user)
  end

  private
  def truck_params
    params.require(:truck).permit(:name,:description)
  end
end
