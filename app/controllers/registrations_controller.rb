class RegistrationsController < Devise::RegistrationsController
	
	def new
		super
	end

	def create
		if params[:user][:code].blank?
			flash[:notice] = "Please provide assigned code to the given email !"
			redirect_to new_user_registration_path
		else
			if params[:user][:code] == "foobar"
				flash[:notice] = "Please provide assigned code to the given email !!"
				redirect_to new_user_registration_path
			else
				code = SecretCode.find_by_email(params[:user][:email]).code
				if code != params[:user][:code]
					flash[:alert] = "Please provide assigned code to the given email !!!"
					redirect_to new_user_registration_path
				else
					super
				end				
			end
		end
	end

	def update
		user = User.find_by_email(params[:user][:email])
		user.first = params[:user][:first]
		user.last = params[:user][:last]
		user.save
		super
	end

	private

	def sign_up_params
		params.require(:user).permit(:email, :code, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:email, :code, :password, :password_confirmation, :current_password)
	end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first, :last)
    end
end
