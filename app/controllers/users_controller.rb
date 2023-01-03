class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @user = User.new(new_user_params)

    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to @user
    else
      render action: 'new'
    end
  end

  def update
    p = user_params[:password].blank? ? user_without_password_params : user_params

    if @user.update(p)
      flash[:notice] = 'User was successfully updated.'
      redirect_to @user
    else
      render action: 'edit'
    end
  end

  def destroy
    if @user.id == 1
      flash[:notice] = "You can't delete the main administrator!"
      redirect_to users_url
    else
      @user.destroy
      redirect_to users_url
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email,
                                 :username,
                                 :password,
                                 :password_confirmation,
                                 :remember_me,
                                 :can_update_users,
                                 :can_update_items,
                                 :can_update_configuration,
                                 :can_view_reports,
                                 :can_update_sale_discount,
                                 :can_remove_sales)
  end
  
  def user_without_password_params
    params.require(:user).permit(:email,
                                 :username,
                                 :remember_me,
                                 :can_update_users,
                                 :can_update_items,
                                 :can_update_configuration,
                                 :can_view_reports,
                                 :can_update_sale_discount,
                                 :can_remove_sales)
  end

  def new_user_params
    params.require(:user).permit(:email,
                                 :username,
                                 :password,
                                 :password_confirmation)
  end
end
