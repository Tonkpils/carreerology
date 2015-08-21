require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  let(:valid_attributes) {
    {
      name: "Software Engineer",
      description: "Best job in the whole world!",
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      description: "I have no name :("
    }
  }

  describe "GET #index" do
    it "assigns all jobs as @jobs" do
      job = Job.create! valid_attributes
      get :index, {}
      expect(assigns(:jobs)).to eq([job])
    end
  end

  describe "GET #new" do
    login_admin

    it "assigns a new job as @job" do
      get :new, {}
      expect(assigns(:job)).to be_a_new(Job)
    end
  end

  describe "GET #edit" do
    login_admin

    it "assigns the requested job as @job" do
      job = Job.create! valid_attributes
      get :edit, {:id => job.to_param}
      expect(assigns(:job)).to eq(job)
    end

    context "with a non-existant job" do
      it "raises a record not found error" do
        expect {
          get :edit, {id: 1337}
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Job" do
        expect {
          post :create, {job: valid_attributes}
        }.to change(Job, :count).by(1)
      end

      it "assigns a newly created job as @job" do
        post :create, {job: valid_attributes}
        expect(assigns(:job)).to be_a(Job)
        expect(assigns(:job)).to be_persisted
      end

      it "redirects to the created job" do
        post :create, {job: valid_attributes}
        expect(response).to redirect_to(jobs_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved job as @job" do
        post :create, {job: invalid_attributes}
        expect(assigns(:job)).to be_a_new(Job)
      end

      it "re-renders the 'new' template" do
        post :create, {job: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    login_admin

    context "with valid params" do
      let(:new_attributes) {
        {
          name: "Software Engineer",
          description: "We get ping pong tables"
        }
      }

      it "updates the requested job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, job: new_attributes}
        job.reload

        expect(job.name).to eq(new_attributes[:name])
        expect(job.description).to eq(new_attributes[:description])
      end

      it "assigns the requested job as @job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, job: valid_attributes}
        expect(assigns(:job)).to eq(job)
      end

      it "redirects to the job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, job: valid_attributes}
        expect(response).to redirect_to(jobs_url)
      end
    end

    context "with invalid params" do
      it "assigns the job as @job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, job: invalid_attributes}
        expect(assigns(:job)).to eq(job)
      end

      it "re-renders the 'edit' template" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, job: invalid_attributes}
        expect(response).to render_template("edit")
      end

      it "raises a record not found error with an nonexistant job" do
        expect {
          put :update, {id: 1337}
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "DELETE #destroy" do
    login_admin

    it "destroys the requested job" do
      job = Job.create! valid_attributes
      expect {
        delete :destroy, {:id => job.to_param}
      }.to change(Job, :count).by(-1)
    end

    it "redirects to the jobs list" do
      job = Job.create! valid_attributes
      delete :destroy, {:id => job.to_param}
      expect(response).to redirect_to(jobs_url)
    end

    it "raises a record not found error with an nonexistant job" do
      expect {
        put :update, {id: 1337}
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
