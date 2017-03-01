class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :update]
  before_action :find_user, only: [:show, :edit, :destroy, :update, :edit_password]
  before_action :authorize, only: [:edit, :update, :edit_password]

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name,
                                                 :last_name,
                                                 :email,
                                                 :password,
                                                 :password_confirmation)
    @user = User.new user_params
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Account created successfully!'
      else
        render :new
      end
   end

   def edit

   end

   def update
     user_params = params.require(:user).permit(:first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation)

     if @user.update_attributes(user_params)
       flash.now[:success] = "Profile updated"
       redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit_password
  end

  def update_password
      password_params
      @user = User.find params[:id]

       if @user&.authenticate(params[:user][:current_password])
           if @user.update user_params
             session[:user_id] = @user.id
             redirect_to root_path, notice: 'Your password was changed! Yay!'
           else
             render :edit
           end
       else
         flash.now[:alert] = 'You enter the wrong password'
         render :edit_password
       end
    end

     private

     def password_params
       params.require(:user).permit(:password,
                        :password_confirmation)
     end

     def find_user
       @user = User.find params[:id]
     end

     def authorize
       if cannot?(:manage, @user)
         redirect_to root_path,notice:'You can\'t edit another user!'
       end
     end



end
