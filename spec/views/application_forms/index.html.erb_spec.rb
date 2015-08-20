require 'rails_helper'

RSpec.describe "application_forms/index", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(name: "Software Engineer", description: "Best Job"))
    assign(:application_forms, [
      ApplicationForm.create!(
        :name => "Name",
        :email => "Email",
        :address => "Address",
        :phone_number => "Phone Number",
        :job => @job
      ),
      ApplicationForm.create!(
        :name => "Name",
        :email => "Email+1",
        :address => "Address",
        :phone_number => "Phone Number+1",
        :job => @job
      )
    ])
  end

  it "renders a list of application_forms" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 1
    assert_select "tr>td", :text => "Email+1".to_s, :count => 1
  end
end
