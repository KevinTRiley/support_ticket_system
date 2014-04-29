module Api
  module V1
    class DevicesController < ApplicationController
      respond_to :json

      def index
        respond_with Device.all.sort { |x, y| y.issues.find(:first, :order => "created_at desc").created_at <=> x.issues.find(:first, :order => "created_at desc").created_at}
      end

      def show
        respond_with Device.find(params[:id])
      end

      def create
        respond_with Device.create(params[:product])
      end

      def update
        respond_with Device.update(params[:id], params[:products])
      end

      def destroy
        respond_with Device.destroy(params[:id])
      end
    end
  end
end