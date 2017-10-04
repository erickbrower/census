class Api::V1::AuthenticationController < ApiController
  def authenticate
    user = User.find_for_database_authentication(email: params[:email])
    if user && user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {
        errors: [
          {
            field: 'username',
            message: 'Invalid username or password'
          }
        ]
      },
      status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user && user.id
    {
      id: user.id,
      email: user.email,
      auth_token: JsonWebToken.encode(user_id: user.id)
    }
  end
end
