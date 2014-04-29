module Api
  module V1
    class PlatformsController < ApplicationController
      respond_to :json

      def index
        respond_with Platform.all
      end

      def show
        respond_with Platform.find(params[:id])
      end

      def create
        respond_with Platform.create(params[:product])
      end

      def update
        respond_with Platform.update(params[:id], params[:products])
      end

      def destroy
        respond_with Platform.destroy(params[:id])
      end
    end
  end
end