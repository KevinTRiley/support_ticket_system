class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :set_devices, :set_platforms, :set_categories

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all.sort { |x, y| x.created_at <=> y.created_at}
    @devices = Device.all

    respond_to do |format|
      format.html
      format.json { render json: @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show

    respond_to do |format|
      format.html
      format.json { render json: @issue }
    end
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        IssueNotifier.new_issue(@issue).deliver
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @issue }
      else
        format.html { render action: 'new' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update

    respond_to do |format|
      if @issue.update(issue_params)
        if @issue.state.to_s == "Resolved"
          session[:resolved_issue_id] = @issue.id
          format.html { redirect_to new_resolution_path, action: "new" }
          #IssueNotifier.resolved(@issue).deliver
        else
          format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end
    def set_devices
      @devices = Device.order(:name => :asc).all
    end
    def set_platforms
      @platforms = Platform.order(:name => :asc).all
    end
    def set_categories
      @categories = Category.order(:name => :asc).all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:description, :state, :urgency, :picture, :attachment, :email, :device_id, :platform_id, :category_id)
    end
end
