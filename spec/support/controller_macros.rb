module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in Admin.where(email: "leo@correa.com").first_or_create!(password: "password", password_confirmation: "password")
    end
  end
end
