class UserrsController < ApplicationController
  def index
  	@users = User.all
  	@user = User.only_deleted # to find deleted user
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.role = params[:user][:role]

		respond_to do |format|
			if @user.save
				format.html { redirect_to :controller=>'userrs',:action=>'index', notice: 'User was successfully created.' }
			else
			  format.html { render :new , notice: 'error creating user created.' }
			end
		end
  
  end

  def activate_account
    User.restore(params[:id])
    redirect_to :controller=>'userrs',:action=>'index'
  end

  def delete
    user = User.find(params[:id])
    user.delete
    redirect_to :controller=>'userrs',:action=>'index'
  end

end
