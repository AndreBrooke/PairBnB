class UsersController < Clearance::UsersController

	def new
		@user = User.new
	end

	def edit
		@user = current_user
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)

		if @user.save
			sign_in @user
			redirect_to '/'
		else
			render template: "users/new"
		end
	end

	def update
		@user = current_user

		if @user.update(user_params)
			redirect_to @user
		else
			render template: "users/new"
		end
	end

	private
	
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

end
