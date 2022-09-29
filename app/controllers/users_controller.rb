class UsersController < ApplicationController
  skip_before_action :authenticate_and_set_user

  def reactivate
    @current_user = User.find_by_email(params[:email])
    if @current_user&.authenticate(params[:password])
      if @current_user.update(active: true)
        render_success(message: "User reactivated successfully")
      else
        render_error(422, message: @current_user.errors)
      end
    else
      render_error(422, message: I18n.t('api_guard.authentication.invalid_login_credentials'))
    end
  end

  def search
    @users = User.search_by_name(params[:query]).page(params[:page] || 1)
    render json: { users: @users, meta: KaminariHelper.pagination_meta(@users) }, status: :ok
  end
end
