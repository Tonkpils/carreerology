require 'rails_helper'

RSpec.describe ApplicationFormsController, type: :controller do

  let(:job) { Job.create!(name: "Foo", description: "My Job") }

  let(:valid_attributes) {
    {
      email: "leo@correa.com",
      name: "Leo Correa",
      address: "162 NE 25 ST",
      phone_number: "1112223333",
      job: job,
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  describe "GET #index" do
    login_admin

    it "assigns all application_forms as @application_forms" do
      application_form = ApplicationForm.create! valid_attributes
      get :index, {job_id: job.id}
      expect(assigns(:application_forms)).to eq([application_form])
    end

    it "does not include other job applications" do
      job2 = Job.create!(name: "bar", description: "another")
      another_form = ApplicationForm.create! valid_attributes.merge(job: job2)
      application_form = ApplicationForm.create! valid_attributes
      get :index, {job_id: job.id}
      expect(assigns(:application_forms)).to eq([application_form])
    end
  end

  describe "GET #show" do
    login_admin

    it "assigns the requested application_form as @application_form" do
      application_form = ApplicationForm.create! valid_attributes
      get :show, {job_id: job.id, id: application_form.to_param}
      expect(assigns(:application_form)).to eq(application_form)
    end
  end

  describe "GET #new" do
    it "assigns a new application_form as @application_form" do
      get :new, {job_id: job.id}
      expect(assigns(:application_form)).to be_a_new(ApplicationForm)
    end

    it "assigns the application form to the job" do
      get :new, {job_id: job.id}
      expect(assigns(:application_form).job).to eq(job)
    end

    context "when the job doesn't exist" do

      it "raises an RecordNotFound error" do
        expect {
          get :new, {job_id: 1337}
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ApplicationForm" do
        expect {
          post :create, {job_id: job.id, application_form: valid_attributes}
        }.to change(ApplicationForm, :count).by(1)
      end

      it "assigns a newly created application_form as @application_form" do
        post :create, {job_id: job.id, application_form: valid_attributes}
        expect(assigns(:application_form)).to be_a(ApplicationForm)
        expect(assigns(:application_form).job).to eq(job)
        expect(assigns(:application_form)).to be_persisted
      end

      it "redirects to the created application_form" do
        post :create, {job_id: job.id, application_form: valid_attributes}
        expect(response).to redirect_to(jobs_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved application_form as @application_form" do
        post :create, {job_id: job.id, application_form: invalid_attributes}
        expect(assigns(:application_form)).to be_a_new(ApplicationForm)
      end

      it "re-renders the 'new' template" do
        post :create, {job_id: job.id, application_form: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end
end
