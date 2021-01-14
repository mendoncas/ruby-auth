class Patient::DefaultsController < ApiController
  def show
    render json: Default.all
  end

  def create
    @user = new_user
    @default = Default.create(user: @user, description: params[:description])

    if @user.valid? && @default.valid?
      render json: { user: @user, default: @default }
    else
      User.destroy(@user.id)
      render json: { error: "parâmetros inconpatíveis" }
    end
  end
end
