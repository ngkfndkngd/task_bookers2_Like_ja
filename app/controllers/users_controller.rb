class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:top]
  def index
    @user = current_user
    @users=User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice:'You have creatad book successfully.'
    else
      render :edit
    end
  end
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end