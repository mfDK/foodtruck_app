class UsersController < ApplicationController
  def index
  end

  def my_order
    @user = User.find(params[:user_id])
    @orders = @user.orders.all.reverse.take(1)
    # the take() method is take a certain # of items
    # passed as a argument from a collection(array)
    @foods = Food.all
    @total = 0
  end

  def show
    @user = User.find(current_user)
    @my_orders = current_user.orders
    @trucks = Truck.all 
    # if @user.update_attribute(:latitude, latitude) && @user.update_attribute(:longitude , longitude)
    #   redirect_to @user
    # end

    # @user.update(longitude: params[:longitude],latitude: params[:latitude])
    # if @user.save
    #   render 'show'
    # end
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
    if @user.save
      redirect_to root_path
    end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to new_user_path
  end

  private
  def user_params
  	params.require(:user).permit(:email,:password,:password_confirmation,:fname,:lname,:birthday,:street_address,:state,:city,:zip, :latitude, :longitude)
  end
end
