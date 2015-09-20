require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  before(:each) do
    @request.env['HTTP_REFERER'] = 'http://localhost:3000/'
    @recipe = Recipe.default
    @dreamer = Dreamer.create!(FactoryGirl.attributes_for(:dreamer).merge(recipe: @recipe))
    login(@dreamer)
  end

  describe "GET #show" do
    it "assigns correct recipe to @recipe" do
      get :show, id: @recipe.id
      expect(assigns(:recipe)).to eq @recipe
    end
  end

 describe "GET #new_step" do
    it "assigns new step to @step" do
      get :new_step
      expect(assigns(:step)).to be_a_new Step
    end
  end

 describe "Post #add_step" do
    let!(:borrowed_step) { FactoryGirl.create(:step) }
    it "assigns step in question to recipe in question" do
      post :add_step, id: borrowed_step.id
      @recipe.reload
      expect(@recipe.steps.last).to eq(borrowed_step)
    end
 end

 describe "Post #create_step" do
    it "increases @recipe.steps.count by 1" do
      expect {
        post :create_step, step: FactoryGirl.attributes_for(:step)
        @recipe.reload
      }.to change{@recipe.reload; @recipe.steps.count}.by 1
    end
  end

  describe "patch #update" do
    let!(:step){FactoryGirl.create(:step)}
    let!(:new_attributes){FactoryGirl.attributes_for(:step)}
    let!(:new_description){ new_attributes[:description] }
    it "edits requested step" do
      old_description = step.description
      patch :update, id: step.id, step: new_attributes
      step.reload
      expect(step.description).to eq(new_description)
    end
  end

  describe "get #edit" do
    let!(:step){ Step.create(FactoryGirl.attributes_for(:step).merge(creator: @dreamer)) }
    it "assigns requested step to @step" do
      get :edit_step, id: step.id
      expect(assigns(:step)).to eq(step)
    end
  end

  describe "post #remove_step" do
    context "current dreamer is not creator" do
      it "removes step from dreamer's recipes" do
        @borrowed_step = Step.create(FactoryGirl.attributes_for(:step))
        post :remove_step, id: @borrowed_step.id
        @recipe.reload
        expect(@recipe.steps).not_to include(@borrowed_step)
      end
      it "does not delete step" do
        @borrowed_step = Step.create(FactoryGirl.attributes_for(:step))
        post :remove_step, id: @borrowed_step.id
        @recipe.reload
        expect(Step.all).to include(@borrowed_step)
      end
    end
    context "current dreamer is creator" do
      it "deletes step" do
        @created_step = Step.create(FactoryGirl.attributes_for(:step).merge(creator: @dreamer))
        expect {
          post :remove_step, id: @created_step.id
        }.to change{Step.count}.by -1
      end
    end
  end
end
