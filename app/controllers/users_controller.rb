class UsersController < ApplicationController # inheriting from application controller
	skip_filter :ensure_logged_in, only: :guest_home_page

	def new
		@new_user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@new_user = User.new(user_params)
		if @new_user.save
			redirect_to new_user_path, notice: "You signed up!"
		else 
			render :new, notice: "You failed." # render makes data reusable
		end
	end 

	def update
		@user = User.find(params[:id])
    if @user.update_attributes(user_params)
     	redirect_to user_path
    end
  end

	def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    else
      redirect_to user_path(@user)
    end
  end

  def search
    @users = User.search params[:search]
  end

	def guest_home_page
	end

	private

	def user_params
		params.require(:user).permit!
	end

end