require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  before(:each) do
    @recipe = Recipe.default
    @dreamer = Dreamer.create!(FactoryGirl.attributes_for(:dreamer).merge(recipe: @recipe))
    login(@dreamer)
  end

  describe "GET /recipes/:id" do
    it "assigns correct recipe to @recipe" do
      get :show, id: @recipe.id
      expect(assigns(:recipe)).to eq @recipe 
    end
  end

  # describe "GET #show" do

  #   context 'user is not logged in' do
  #     xit "renders the welcome page" do
  #       get :show, id: dream.id
  #       expect(response).to redirect_to root_path
  #     end
  #   end

  #   context 'user is logged in' do
  #     before :each do
  #       login(dreamer)
  #       get :show, id: dream.id
  #     end

  #     xit "assigns the requested dream to @dream" do
  #       expect(assigns(:dream)).to eq dream
  #     end
  #     xit "renders the :show template" do
  #       expect(response).to render_template :show
  #     end
  #   end

  # end

  # describe "GET #new" do
  #   let!(:dreamer) { FactoryGirl.create(:dreamer) }
  #   let!(:dream) { FactoryGirl.create(:dream)}

  #   context 'user is not logged in' do
  #     xit "renders the welcome page" do
  #       get :new, id: dream.id
  #       expect(response).to redirect_to root_path
  #     end
  #   end

  #   context 'user is logged in' do
  #     xit "assigns an empty dream to @dream" do
  #       login(dreamer)
  #       get :new
  #       expect(assigns(:dream)).to be_a_new Dream
  #     end
  #     xit "renders the :new template" do
  #       login(dreamer)
  #       get :new
  #       expect(response).to render_template :new
  #     end
  #   end
  # end

  # describe "GET #edit" do

  #   context 'user not logged in' do
  #     xit "renders the welcome page" do
  #       get :edit, id: dream.id
  #       expect(response).to redirect_to root_path
  #     end
  #   end

  #   context 'user is logged in' do
  #     before :each do
  #       login(dreamer)
  #       get :edit, id: dream.id
  #     end

  #     xit "assigns the requested dream to @dream" do
  #       expect(assigns(:dream)).to eq dream
  #     end
  #     xit "renders the :edit template" do
  #       expect(response).to render_template :edit
  #     end
  #   end
  # end

  # describe "POST #create" do
  #   before :each do
  #     login(dreamer)
  #     @dreamer_attributes = dreamer.attributes
  #   end

  #   xit "saves the new valid dream" do
  #     expect{
  #       post :create, dream: FactoryGirl.attributes_for(:dream)
  #       }.to change(Dream,:count).by(1)
  #   end
  #   xit "does not save new invalid dream" do
  #     expect{
  #       post :create, dream: @dreamer_attributes.merge(title: nil)
  #       }.to_not change(Dream,:count)
  #   end

  #   xit "redirects to dreams index if valid" do
  #     post :create, dream: FactoryGirl.attributes_for(:dream)
  #     expect(response).to redirect_to dreams_path
  #   end

  #   xit "re-directs to new_dream_path if invalid" do
  #     post :create, dream: @dreamer_attributes.merge(title: nil)
  #     expect(response).to redirect_to new_dream_path
  #   end
  # end

  # describe "PATCH #update" do
  #   before :each do
  #     login(dreamer)
  #     @dream = FactoryGirl.create(:dream, title: "something", story: "something story")
  #   end

  #   xit "updates the dream if valid" do
  #     put :update, id: @dream, dream: FactoryGirl.attributes_for(:dream, title: "title", story: "title story")
  #     @dream.reload
  #     expect(@dream.title).to eq("title")
  #     expect(@dream.story).to eq("title story")
  #   end
  #   xit "does not update the dream if invalid" do
  #     put :update, id: @dream, dream: FactoryGirl.attributes_for(:dream, title: nil, story: "title story")
  #     @dream.reload
  #     expect(@dream.title).to eq("something")
  #     expect(@dream.story).to eq("something story")
  #   end

  #   xit "redirects to dream/:id if valid" do
  #     put :update, id: @dream, dream: FactoryGirl.attributes_for(:dream, title: "title", story: "title story")
  #     @dream.reload
  #     expect(response).to redirect_to dream_path(@dream)
  #   end
  #   xit "re-renders :edit template if invalid" do
  #     put :update, id: @dream, dream: FactoryGirl.attributes_for(:dream, title: nil, story: "title story")
  #     @dream.reload
  #     expect(response).to render_template :edit
  #   end

  # end

  # describe "DELETE #destroy" do
  #   before :each do
  #     login(dreamer)
  #     @dream = FactoryGirl.create(:dream)
  #   end

  #   xit "deletes dream" do
  #     expect{
  #       delete :destroy, id: @dream
  #     }.to change(Dream,:count).by(-1)
  #   end

  #   xit "redirects to /" do
  #     delete :destroy, id: @dream
  #     expect(response).to redirect_to dreams_path
  #   end
  # end
end
