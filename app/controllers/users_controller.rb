class UsersController < ApplicationController
  before_action :logged_in_user, only: [:imdex]

 def index
   @users = User.paginate(page: params[:page], :per_page =>10)
 end



 def show

   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
   @favorites = @user.favposts.order(created_at: :desc)
 end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Simple App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def likes
    @user = User.find(params[:id])
    @favposts = @user.favposts.page(params[:page])
    counts(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
