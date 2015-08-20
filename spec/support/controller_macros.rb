module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in Admin.create(email: "leo@correa.com", password: "password", password_confirmation: "password")
    end
  end
end
