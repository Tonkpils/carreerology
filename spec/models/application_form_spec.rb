require 'rails_helper'

RSpec.describe ApplicationForm, type: :model do
  let(:job) { Job.create!(name: "foo", description: "bar") }
  let(:form) { ApplicationForm.new(email: "foo", name: "bar", job: job, phone_number: "1112223333", address: "123 abc st") }
  [
    :email,
    :name,
    :phone_number,
    :address,
    :job,
  ].each do |attr|
    it "requires #{attr} to be present" do
      form.public_send("#{attr}=", nil)
      expect(form).to be_invalid
    end
  end

  it "only allows one application per email per job" do
    ApplicationForm.create! email: "foo", name: "bar", job: job, phone_number: "1112223334", address: "123 abc st"
    form.save

    expect(form.errors.messages).to eq(email: ["has already been taken"])
  end

  it "only allows one application per phone per job" do
    ApplicationForm.create! email: "foobar", name: "bar", job: job, phone_number: "1112223333", address: "123 abc st"
    form.save

    expect(form.errors.messages).to eq(phone_number: ["has already been taken"])
  end

  it "allows multiple forms for different jobs" do
    job2 = Job.create!(name: "another", description: "job")
    ApplicationForm.create! email: "foo", name: "bar", job: job2, phone_number: "1112223333", address: "123 abc st"
    form.save

    expect(form.errors).to be_empty
  end

end
