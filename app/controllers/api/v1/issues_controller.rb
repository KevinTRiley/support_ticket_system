module Api
  module V1
    class IssuesController < ApplicationController
      respond_to :json

      def index
        respond_with Issue.all.sort { |x, y| x.created_at <=> y.created_at}
      end

      def show
        respond_with Issue.find(params[:id])
      end

      def create
        respond_with Issue.create(params[:product])
      end

      def update
        respond_with Issue.update(params[:id], params[:products])
      end

      def destroy
        respond_with Issue.destroy(params[:id])
      end
    end
  end
end