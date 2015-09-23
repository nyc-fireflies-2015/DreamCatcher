require 'rails_helper'

RSpec.describe StepsController, type: :controller do
  before(:each) do
    @request.env['HTTP_REFERER'] = 'http://localhost:3000/'
    @dreamer = Dreamer.create!(FactoryGirl.attributes_for(:dreamer))
    10.times do
      @dreamer.steps << FactoryGirl.create(:step)
    end
    login(@dreamer)
  end

  describe "GET #recipe" do
    it "assigns correct steps to @steps" do
      get :recipe, @dreamer.id
      expect(assigns(:steps)).to eq @dreamer.steps
    end
  end

 describe "GET #new" do
    it "assigns new step to @step" do
      get :new
      expect(assigns(:step)).to be_a_new Step
    end
  end

 describe "Post #clone" do
    let!(:borrowed_step) { FactoryGirl.create(:step) }
    it "assigns step in question to dreamer in question" do
      post :clone, id: borrowed_step.id
      @dreamer.reload
      expect(@dreamer.steps.last).to eq(borrowed_step)
    end
 end

 describe "Post #create" do
    it "increases @dreamer.steps.count by 1" do
      expect {
        post :create, step: FactoryGirl.attributes_for(:step)
        @dreamer.reload
      }.to change{@dreamer.reload; @dreamer.steps.count}.by 1
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
      get :edit, id: step.id
      expect(assigns(:step)).to eq(step)
    end
  end

  describe "post #remove_step" do
    context "current dreamer is not creator" do
      it "removes step from dreamer's Steps" do
        @borrowed_step = Step.create(FactoryGirl.attributes_for(:step))
        post :remove_step, id: @borrowed_step.id
        @dreamer.reload
        expect(@dreamer.steps).not_to include(@borrowed_step)
      end
      it "does not delete step" do
        @borrowed_step = Step.create(FactoryGirl.attributes_for(:step))
        post :remove_step, id: @borrowed_step.id
        @dreamer.reload
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

