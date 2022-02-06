module Api
  module V1
    class PaymentsController < ApplicationController
      before_action :find_reciver, only: %i[create]
      before_action :authenticate_user!

      def create
        ActiveRecord::Base.transaction do
          sender_account = AccountInfo.find(current_user.id)
          amount = params[:amount].to_f

          if sender_account.card_number.present?
            if amount <= sender_account.amount
              sender_account.amount = sender_account.amount - amount
              @reciver_account.amount = sender_account.amount + amount
              @payment = Payment.new(
                sender_account_id: sender_account.id,
                recipient_account_id: @reciver_account.id,
                amount: amount )
              if @payment.save
                render json: {payment: @payment}, status: :ok
              end
            else
              render json: {message: "you have insuficinet balance"}
            end
          else
            render json: {message: "show error credentials are wrong"}
          end
        rescue StandardError => e
          @errors << e.message
          render json: { errors: @errors.full_messages }
        end
      end

      private

      def find_reciver
        @reciver_account =  AccountInfo.find(params[:recipient_account_id])
      end
    end
  end
end
