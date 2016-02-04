class FoodsController < ApplicationController
  def index
  	@foods = Food.where(truck_id: params[:truck_id]).all
  end

  def show
  	@food = Food.where(truck_id: params[:truck_id],id: params[:id]).first
  end

  def new
  	@current_truck = Truck.find(params[:truck_id])
  	@food = @current_truck.foods.new
  end

  def create
  	@current_truck = Truck.find(params[:truck_id])
  	@food = @current_truck.foods.build(food_params)
  	if @food.save
  		redirect_to truck_path(@current_truck)
  	else
  		redirect_to 'new'
  	end
  end

  def edit
  	@current_truck = Truck.find(params[:truck_id])
  	@food = Food.where(truck_id: @current_truck,id:params[:id]).first
  end

  def update
  	@current_truck = Truck.find(params[:truck_id])
  	@food = Food.where(truck_id: @current_truck,id:params[:id]).first
  	@food.update(food_params)
  	@food.save
  	redirect_to truck_food_path(params[:truck_id], params[:id])
  end

  def destroy
  	@current_truck = Truck.find(params[:truck_id])
  	@food = Food.where(truck_id: @current_truck,id:params[:id]).first
  	@food.destroy
  	redirect_to truck_foods_path
  end

  private
  def food_params 
  	params.require(:food).permit(:food_name,:description,:price)
  end
end
