require 'rails_helper'

RSpec.describe DreamersController, type: :controller do
  before(:all) do
    @admin = Dreamer.create(name: "DreamCatcher", username: "DreamCatcher", password: "dreamingfireflies", email: "dreamcatcher@gmail.com")
    @dreamer = FactoryGirl.create(:dreamer)
    @dreamer_attributes = @dreamer.attributes
  end

  describe 'GET #new' do
    it 'assigns a new dreamer' do
      get :new
      expect(assigns(:dreamer)).to be_a_new(Dreamer)
    end
  end

  describe 'POST #create' do
    context "valid attributes" do
      it 'creates a new dreamer' do
        post :create, dreamer: @dreamer_attributes
        expect(Dreamer.last.username).to eq(@dreamer.username)
        expect(Dreamer.last.email).to eq(@dreamer.email)
      end

      it "redirects to homepage with successful sign up" do
        post :create, dreamer: {username: "abby", name: "something", password: "password", email: "email@gmail.com"}
        expect(response).to redirect_to root_path
      end
    end

    context "invalid attributes" do
      it "does not create new dreamer with invalid attributes" do
        expect{
          post :create, dreamer: @dreamer_attributes.merge(username: nil)
        }.to change(Dreamer, :count).by(0)
      end

      it "redirects to sign up page with unsuccessful sign up" do
        post :create, dreamer: @dreamer_attributes.merge(username: nil)
        expect(response).to redirect_to signup_path
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @dreamer = FactoryGirl.create(:dreamer, username: "username")
      session[:dreamer_id] = @dreamer.id
    end

    context "valid attributes" do
      it "changes dreamer's attributes" do
        put :update, id: @dreamer, dreamer: FactoryGirl.attributes_for(:dreamer, username: "updated username")
        @dreamer.reload
        expect(@dreamer.username).to eq("updated username")
      end

      it "redirects to the updated dreamer profile" do
        session[:dreamer_id] = @dreamer.id
        put :update, id: @dreamer, dreamer: FactoryGirl.attributes_for(:dreamer)
        expect(response).to render_template "dreamers/_stats"
      end
    end

    context "invalid attributes" do
      it "does not change dreamer's attributes" do
        put :update, id: @dreamer, dreamer: FactoryGirl.attributes_for(:dreamer, username: nil), format: :js
        @dreamer.reload
        expect(@dreamer.username).to eq("username")
        expect(response).to have_http_status(400)
      end
    end
  end
end
