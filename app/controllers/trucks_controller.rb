class TrucksController < ApplicationController
  def index
    @trucks = Truck.all 
  end

  def show
    @truck = Truck.find(params[:id])
    @foods = Food.where(truck_id: params[:id]).all
  end

  def new
    @truck = Truck.new
  end

  def create
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
