require 'rails_helper'

RSpec.describe "application_forms/show", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(name: "S.E.", description: "Test"))
    @application_form = assign(:application_form, ApplicationForm.create!(
      :name => "Name",
      :email => "Email",
      :address => "Address",
      :phone_number => "Phone Number",
      :job => @job
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(//)
  end
end
