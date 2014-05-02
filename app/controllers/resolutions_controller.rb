class ResolutionsController < ApplicationController
  before_action :set_resolution, only: [:show, :edit, :update, :destroy]
  before_action :set_resolved_issue

  # GET /resolutions
  # GET /resolutions.json
  def index
    @resolutions = Resolution.all
  end

  # GET /resolutions/1
  # GET /resolutions/1.json
  def show
  end

  # GET /resolutions/new
  def new
    @resolution = Resolution.new

    if (session[:resolved_issue_id])
      @resolution.issue_id = session[:resolved_issue_id]
    else
      redirect_to issues_url, notice: 'Cannot create a new resolution without being redirected from the edit issue page.'
    end
  end

  # GET /resolutions/1/edit
  def edit
  end

  # POST /resolutions
  # POST /resolutions.json
  def create
    @resolution = Resolution.new(resolution_params)

    respond_to do |format|
      if @resolution.save
        if (@resolution.issue)
          if (@resolution.issue.email)
            IssueNotifier.resolved(@resolution.issue, @resolution.email_message).deliver
          end
        end
        format.html { redirect_to @resolution, notice: 'Resolution was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resolution }
      else
        format.html { render action: 'new' }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resolutions/1
  # PATCH/PUT /resolutions/1.json
  def update
    respond_to do |format|
      if @resolution.update(resolution_params)
        format.html { redirect_to @resolution, notice: 'Resolution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resolutions/1
  # DELETE /resolutions/1.json
  def destroy
    @resolution.destroy
    respond_to do |format|
      format.html { redirect_to resolutions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resolution
      @resolution = Resolution.find(params[:id])
    end
    def set_resolved_issue
      if session[:resolved_issue_id]
        @issue = Issue.find(session[:resolved_issue_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resolution_params
      params.require(:resolution).permit(:issue_id, :note, :email_message)
    end
end
