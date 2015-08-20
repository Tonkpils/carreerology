class ApplicationFormsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show]
  before_action :set_application_form, only: [:show]

  # GET /application_forms
  def index
    @job = Job.find(params[:job_id])
    @application_forms = @job.application_forms
  end

  # GET /application_forms/1
  def show
  end

  # GET /application_forms/new
  def new
    @job = Job.find(params[:job_id])
    @application_form = @job.application_forms.build
  end

  # POST /application_forms
  def create
    @job = Job.find(params[:job_id])
    @application_form = @job.application_forms.build(application_form_params)

    if @application_form.save
      redirect_to jobs_url, notice: 'Application successfully submitted'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_form
      @application_form = ApplicationForm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def application_form_params
      params.require(:application_form).permit(:name, :email, :address, :phone_number, :job_id)
    end
end
