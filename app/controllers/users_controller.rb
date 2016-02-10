class UsersController < ApplicationController
  def index
  end

  def my_order
    # This action was created to show a current users orders, this view is my_order.html.erb
    @user = User.find(params[:user_id])
    @orders = @user.orders.all.reverse.take(1)
    # the take() method is take a certain # of items
    # passed as a argument from a collection(array)
    # This should use the .last method instead
    @foods = Food.all
    @total = 0
    # This total is used to get the total of the most recent order of the current user
  end

  def show
    @user = User.find(current_user)
    @my_orders = current_user.orders
    # This gets all orders pertaining to the current user logged in
    @trucks = Truck.all 
    # This shows all trucks when a user is not a truck
    # owner
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "You have been successfully created"
  		redirect_to root_path
      # This is directed to the edit_user_path to fill in the rest of the credentials needed for a user such as first name, last name etc...
  	else
      flash[:alert] = "You have an error"
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
      redirect_to user_path(current_user)
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
