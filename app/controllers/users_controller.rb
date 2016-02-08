class UsersController < ApplicationController
  def index
  end

  def show
  	@user = User.find(current_user)
    @test_truck = Truck.find(5)
    @my_orders = current_user.orders
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "You have been successfully created"
  		redirect_to edit_user_path(@user)
  	else
  		render 'new'
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	@user.save
  	redirect_to root_path
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to new_user_path
  end

  private
  def user_params
  	params.require(:user).permit(:email,:password,:password_confirmation,:fname,:lname,:birthday,:street_address,:state,:city,:zip)
  end
end
