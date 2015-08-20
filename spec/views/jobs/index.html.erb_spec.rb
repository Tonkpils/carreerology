require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  context "with jobs available" do
    before(:each) do
      assign(:jobs, [
        Job.create!(
          :name => "Name",
          :description => "MyText"
        ),
        Job.create!(
          :name => "Name",
          :description => "MyText"
        )
      ])
    end


    it "renders a list of jobs" do
      render
      assert_select "div.mdl-card>div.mdl-card__title>h2.mdl-card__title-text", :text => "Name".to_s, :count => 2
      assert_select "div.mdl-card>div.mdl-card__supporting-text", :text => "MyText".to_s, :count => 2
    end
  end

  context "with no jobs" do

    it "renders no jobs available with no jobs" do
      assign(:jobs, [])
      render
      assert_select "h3>small", text: "No job listings available", count: 1
    end
  end
end
