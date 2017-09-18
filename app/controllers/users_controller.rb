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

	# def user_from_params
	# 	@user_params = params[:user] || Hash.new
	# 	name = @user_params.delete(:name)
	# 	email = @user_params.delete(:email)
	# 	password = @user_params.delete(:password)

	# 	Clearance.configuration.user_model.new(user_params).tap do |user|
	# 		user.name = name
	# 		user.email = email
	# 		user.password = password
	# 	end
	# end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end
