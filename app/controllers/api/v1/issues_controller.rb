module Api
  module V1
    class IssuesController < ApplicationController
      skip_before_action :authorize
      respond_to :json

      def create
        @issue = Issue.new(issue_params)
        if @issue.save
          IssueNotifier.new_issue(@issue).deliver
          render
        else
          render json: @issue.errors, status: :unprocessable_entity
        end
      end

      private
        # Never trust parameters from the scary internet, only allow the white list through.
        def issue_params
          params.require(:issue).permit(:description, :state, :urgency, :picture, :attachment, :email, :device_id, :platform_id, :category_id)
        end
    end
  end
end