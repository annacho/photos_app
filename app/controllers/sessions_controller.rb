class SessionsController < ApplicationController
	skip_filter :ensure_logged_in

	def new
	end

	def create
		# user = User.authenticate(params[:email], params[:password])

		user = User.find_by_email(params[:email]).try(:authenticate, params[:password])

		# user = User.find_by_email(params[:email])
		# if user
		# 	user.authenticate(params[:password])
		# end

		if user
			# session starts out as an empty hash. {session: }
			session[:user_id] = user.id # { session: {user_id: user.id} }. session refers to all your cookies that you once stored. it's a variable provided by rails.
			redirect_to root_path, notice: "Logged In"
		else # if there is no user 
			flash.now.alert = "Invalid Email or Password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path, notice: "You logged out!"
	end

end