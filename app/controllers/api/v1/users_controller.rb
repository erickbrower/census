class Api::V1::UsersController < ApiController
  def index
    render json: User.all
  end

  def create
    @user = User.new(user_attributes)
    if @user.save
      render json: @user, status: :created, location: "/api/v1/users/#{@user.id}"
    else
      respond_with_errors(@user)
    end
  end

  def update
    @user = User.where(id: params[:id]).first
    if @user
      if @user.update_attributes(user_attributes)
        render json: @user, location: "/api/v1/users/#{@user.id}"
      else
        respond_with_errors(@user)
      end
    else
      render json: {}, status: :not_found
    end
  end

  def show
    @user = User.where(params[:id]).first
    if @user
      render json: @user, location: "/api/v1/users/#{@user.id}"
    else
      render json: {}, status: :not_found
    end
  end

  def destroy
    @user = User.where(id: params[:id]).first
    if @user
      @user.destroy
      render json: @user
    else
      render json: {}, status: :not_found
    end
  end

  private
  def user_params
    params.require(:data).permit(:type, {
      attributes: [:email, :password, :password_confirmation]
      })
  end

  def user_attributes
    user_params[:attributes] || {}
  end
end
