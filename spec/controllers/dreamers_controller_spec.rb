require 'rails_helper'

RSpec.describe DreamersController, type: :controller do
  before(:all) do
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
        pending
        post :create, dreamer: @dreamer_attributes
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
        expect(response).to redirect_to new_dreamer_path
      end
    end
  end

end
