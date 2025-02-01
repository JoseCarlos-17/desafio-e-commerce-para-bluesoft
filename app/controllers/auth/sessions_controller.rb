module Auth
  class SessionsController < DeviseTokenAuth::SessionsController
    private

    def resource_params
      params.permit(:email, :password)
    end
  end
end