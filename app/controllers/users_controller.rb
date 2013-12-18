class UsersController < ApplicationController
  before_action :find_user, except: :index
  layout "user"

  def index
    @users = User.all.page(params[:page])
  end

  def show_evaluates
    @evaluates = @user.evaluates
  end

  def show
    @evaluates = @user.evaluates.limit(8)
  end

  def setting_cover
    current_user.skip_password = true
    current_user.update(cover_id: params[:cover_id])
    flash[:success] = '设置成功！'
    redirect_to account_user_picture_path(current_user)
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

end
