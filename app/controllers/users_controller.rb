class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :auth_token]

  # POST /users
  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password],
    password_confirmation: params[:password_confirmation])

    if @user.save
      render json: { jwt: auth_token.token }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def auth_token
      Knock::AuthToken.new payload: { sub: @user.id }
    end

end
