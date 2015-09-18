require 'rails_helper'

RSpec.describe DreamsController, type: :controller do

  describe "GET /" do
    context 'user is not logged in' do
    end

    context 'user is logged in' do
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end

      it "populates an array of all dreams" do
      end
    end
  end

  describe "GET #show" do
    let!(:dream) { FactoryGirl.create(:dream) }

    before :each do
      get :show, id: dream.id
    end

    context 'user is not logged in' do
    end

    context 'user is logged in' do
      it "assigns the requested dream to @dream" do
        expect(assigns(:dream)).to eq dream
      end
      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end
  end

  describe "GET #new" do
    let!(:dreamer) { FactoryGirl.create(:dreamer) }
    let!(:dream) { FactoryGirl.create(:dream)}

    context 'user is not logged in' do
    end

    context 'user is logged in' do
      it "assigns an empty dream to @dream" do
        login(dreamer)
        get :new
        expect(assigns(dreamer.dream)).to be_a_new Dream
      end
      it "renders the :new template" do
        login(dreamer)
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    let!(:dream) { FactoryGirl.create(:dream) }

    context 'user not logged in' do
    end

    context 'user is logged in' do
      before :each do
        get :edit, id: dream.id
      end

      it "assigns the requested dream to @dream" do
        expect(assigns(:dream)).to eq dream
      end
      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    it "saves the new valid question"
    it "does not save new invalid question"
    it "redirects to questions/:id if valid"
    it "re-renders :new template if invalid"
  end

  describe "PATCH #update" do
    it "updates the question if valid"
    it "does not update the question if invalid"
    it "redirects to questions/:id if valid"
    it "re-renders :edit template if invalid"
  end

  describe "DELETE #destroy" do
    it "deletes question"
    it "redirects to /"
  end

end
