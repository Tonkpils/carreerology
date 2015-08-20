require "rails_helper"

RSpec.describe ApplicationFormsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/jobs/1/application_forms").to route_to("application_forms#index", job_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/jobs/1/application_forms/new").to route_to("application_forms#new", job_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/jobs/1/application_forms/1").to route_to("application_forms#show", job_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(:post => "/jobs/1/application_forms").to route_to("application_forms#create", job_id: "1")
    end

  end
end
