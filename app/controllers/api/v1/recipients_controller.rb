module Api
  module V1
    class RecipientsController < ApplicationController
      respond_to :json

      def index
        respond_with Recipient.all
      end

      def show
        respond_with Recipient.find(params[:id])
      end

      def create
        respond_with Recipient.create(params[:product])
      end

      def update
        respond_with Recipient.update(params[:id], params[:products])
      end

      def destroy
        respond_with Recipient.destroy(params[:id])
      end
    end
  end
end