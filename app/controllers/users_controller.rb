class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :followings, :followers]
  before_action :set_prefectures, only: [:edit, :update]
  
  def show
    @microposts = @user.microposts.order(created_at: :desc)

  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile has been edited"
      redirect_to edit_user_path
    else
      render 'edit'
    end
  end
  
  def followings
    @users = @user.following_users.order(created_at: :desc)
    render 'followings'
  end
  
  def followers
    @users = @user.follower_users.order(created_at: :desc)
    render 'followers'
  end
  
    
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :url, :self_introduction)
  end
  
  def find_user
    @user = User.find(params[:id])
  end
  
  def set_prefectures
    @prefectures = Prefecture.all
  end
end
