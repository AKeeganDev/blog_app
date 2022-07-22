module Api
  module V1
    class AuthenticationController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      def create
        # p params.require(:id).inspect
        user = User.find(params.require(:id))
        token = AuthenticationTokenService.call(user.id)
        render json: { user_token: token }, status: :created
      end

      private

      def parameter_missing(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end
    end
  end
end
