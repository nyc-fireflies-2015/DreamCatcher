require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  context "new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#login" do
    let(:dreamer) { FactoryGirl.create(:dreamer)}

    it "redirects to root path if correct credentials" do
      post :create, session:{username: dreamer.username, password: dreamer.password}
      expect(response).to redirect_to root_path
    end
    it "renders login path with bad email" do
      post :create, session:{username: "wrong@email.com", password: 'passwordddd'}
      expect(response).to render_template('new')
    end
    it "renders login path with bad password" do
      post :create, session:{username: dreamer.username, password: "wrong password"}
      expect(response).to render_template('new')
    end
  end
end
