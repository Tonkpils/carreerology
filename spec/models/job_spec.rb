require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:job) { Job.new(name: "foo", description: "bar") }

  it "validates presence of name" do
    job.name = nil
    expect(job).to be_invalid
  end

  it "validates presence of description" do
    job.description = nil
    expect(job).to be_invalid
  end

  it "has many application forms" do
    expect(job.application_forms).to be_empty
  end
end
