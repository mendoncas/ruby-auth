class User::UsersController < ApiController
  # before_action :authorized, only: [:auto_login]

  def show
    render json: User.all
  end

  def destroy
    @user = User.find_by(id: params[:id])
    render json: { user: @user }
    User.destroy(@user.id)
  end

  def login
    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: "invalid username or password", user: @user }
    end
  end

  def auto_login
    render json: @user
  end
end
