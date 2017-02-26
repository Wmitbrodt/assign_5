class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:edit]
  before_action :authorize, only: [:edit,:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Account created successfully!'
      else
        render :new
      end
   end

   def edit
     @user = User.find params[:id]
   end

   def update
     @user = User.find params[:id]
     user_params
     if @user.update_attributes(user_params)
       flash.now[:success] = "Profile updated"
       redirect_to root_path
    else
      render 'edit'
    end
  end

  # def change_password
  #   # step 1: verify with user.authenticate, pass in params and current password
  #   user = User.find_by_email params[:email]
  #   if user&.authenticate(params[:password])
  #   session[:user_id] = user.id
  #   # step 2: make sure the new pass = to new_pass_confirmation (string comparison)
  #
  #   # step 3: simply user update to change pass field
  # if @user.update_attributes(user_params)
  #   flash.now[:success] = "Profile updated"
  #   redirect_to root_path
  # end

     private

     def user_params
       params.require(:user).permit(:first_name,
                                    :last_name,
                                    :email,
                                    :password,
                                    :password_confirmation)
     end

     def authorize
       @user = User.find params[:id]
       if cannot?(:manage, @user)
         redirect_to root_path,notice:'You can\'t edit another user!'
       end
     end



end
