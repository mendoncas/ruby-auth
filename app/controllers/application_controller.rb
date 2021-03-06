class ApplicationController < ActionController::API
  before_action :authorized, only: [:is_admin]
  # before_action :require_admin, only: [:show]

  def encode_token(payload)
    JWT.encode(payload, "meusegredo")
  end

  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    if auth_header
      token = auth_header.split(" ")[1]
      begin
        JWT.decode(token, "meusegredo", true, algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      @user = User.find_by(id: user_id)
    end
  end

  def new_user
    @user = User.create(user_params)
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: "faça seu login" }, status: :unauthorized unless logged_in?
  end

  def user_params
    params.permit(:username, :password, :age, :admin)
  end
end
