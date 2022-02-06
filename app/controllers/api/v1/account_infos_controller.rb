module Api
  module V1
    class AccountInfosController < ApplicationController
      before_action :authenticate_user!

      def create
        @account_info = current_user.build_account_info(account_info_params)
        if @account_info.save
          render json: @account_info.as_json, status: 201
        else
          render json: { errors: @account_info.errors.full_messages }, status: 422
        end
      end

      private

      def account_info_params
        params.require(:account_info).permit(*AccountInfo::ATTRIBUTES_WHITELIST)
      end
    end
  end
end
