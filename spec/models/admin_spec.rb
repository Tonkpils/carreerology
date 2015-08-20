require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { Admin.new(email: "leo@correa.com", password: "password", password_confirmation: "password") }

  it "requires an email" do
    admin.email = nil
    expect(admin).to be_invalid
  end
end
