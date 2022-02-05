module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :find_user, only: %i[update show]

      def update
        if @user.update(user_params)
          render json: @user.as_json, status: 201
        else
          render json: { errors: @user.errors.full_messages }, status: 422
        end
      end

      def show
        render json: { user: @user.as_json }, status: :ok
      end


      private

      def user_params
        params.require(:user).permit(*User::ATTRIBUTES_WHITELIST)
      end

      def find_user
        @user = User.find(params[:id])
      end
    end
  end
end
