RSpec.describe SessionsController do
  describe "create session" do
    let!(:email) { 'email@mail.com' }
    let!(:password) { 'password' }

    let!(:valid_credentials) {{
        email: email,
        password: password
    }}

    it "log in user " do
      FactoryGirl.create(:user, email: email, password: password )

      post :create, session: valid_credentials, format: :json

      expect(subject.logged_in?).to be_truthy
    end
  end

  describe "destroy session" do
    let!(:email) { 'email@mail.com' }
    let!(:password) { 'password' }

    let!(:valid_credentials) {{
        email: email,
        password: password
    }}

    it "log out user " do
      FactoryGirl.create(:user, email: email, password: password )

      post :create, session: valid_credentials, format: :json
      expect(subject.logged_in?).to be_truthy
      
      delete :destroy
      expect(subject.logged_in?).to be_falsy
    end
  end
end