require 'rails_helper'

RSpec.describe DreamsController, type: :controller do

  describe "GET /" do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

    it "populates an array of all dreams" do
    end
  end

  describe "GET #show" do
    let!(:dream) { FactoryGirl.create(:dream) }

    before :each do
      get :show, id: dream.id
    end

    it "assigns the requested dream to @dream" do
      expect(assigns(:dream)).to eq dream
    end
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns an empty question to @question"
    it "renders the :new template"
  end

  describe "GET #edit" do
    it "assigns the requested question to @question"
    it "renders the :edit template"
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
