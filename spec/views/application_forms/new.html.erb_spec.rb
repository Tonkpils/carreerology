require 'rails_helper'

RSpec.describe "application_forms/new", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(name: "S.E", description: "Test"))
    assign(:application_form, ApplicationForm.new(
      :name => "MyString",
      :email => "MyString",
      :address => "MyString",
      :phone_number => "MyString",
      :job => @job
    ))
  end

  it "renders new application_form form" do
    render

    assert_select "form[action=?][method=?]", job_application_forms_path(@job), "post" do

      assert_select "input#application_form_name[name=?]", "application_form[name]"

      assert_select "input#application_form_email[name=?]", "application_form[email]"

      assert_select "input#application_form_address[name=?]", "application_form[address]"

      assert_select "input#application_form_phone_number[name=?]", "application_form[phone_number]"
    end
  end
end
