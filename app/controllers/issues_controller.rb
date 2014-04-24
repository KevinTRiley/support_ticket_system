class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :set_devices, :set_platforms

  # GET /issues
  # GET /issues.json
  def index
    #@issues = Issue.all
    @devices = Device.all

    devicesMostRecentIssues = Array.new
    # Sort each device issues by created_at descending and add the first record to the array
    @devices.each { |device| devicesMostRecentIssues.push(device.issues.find(:first, :order => "created_at desc")) }
    # Sort each unique issue by created_at descending
    @issues = devicesMostRecentIssues.sort { |x, y| x.created_at <=> y.created_at}

  end

  # GET /issues/1
  # GET /issues/1.json
  def show
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
          IssueNotifier.resolved(@issue).deliver
        end
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
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
      @devices = Device.all.map { |device| [device.name, device.id] }
    end
    def set_platforms
      @platforms = Platform.all.map { |platform| [platform.name, platform.id] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:description, :state, :urgency, :picture, :attachment, :email, :device_id, :platform_id)
    end
end
