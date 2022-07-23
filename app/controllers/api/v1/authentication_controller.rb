module Api
  module V1
    class AuthenticationController < ApplicationController
      skip_before_action :verify_authenticity_token

      def login
        user = User.find_by('lower(email) = ?', user_params[:email].downcase)
        if user&.authenticate(user_params[:password])
          render json: { token: token(user.id), user_id: user.id }, status: :created
        else
          render json: { errors: ['Sorry, incorrect email or password'] }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name)
      end

      #   rescue_from ActionController::ParameterMissing, with: :parameter_missing
      #   def create
      #     user = User.find(params.require(:id))
      #     token = AuthenticationTokenService.call(user.id)
      #     render json: { user_token: token }, status: :created
      #   end

      #   private

      #   def parameter_missing(error)
      #     render json: { error: error.message }, status: :unprocessable_entity
      #   end
      # end
      # end
    end

    # module Api
    #   module V1
    #     class AuthenticationController < ApplicationController
    #       rescue_from ActionController::ParameterMissing, with: :parameter_missing
    #       def create
    #         user = User.find(params.require(:id))
    #         token = AuthenticationTokenService.call(user.id)
    #         render json: { user_token: token }, status: :created
    #       end

    #       private

    #       def parameter_missing(error)
    #         render json: { error: error.message }, status: :unprocessable_entity
    #       end
    #     end
    #   end
    # end
  end
end
