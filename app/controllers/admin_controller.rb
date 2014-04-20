class AdminController < ApplicationController
  def index
    @total_issues = Issue.count
  end
end
