require 'rails_helper'

describe DreamsController do
  let(:dream) { FactoryGirl.create(:dream) }
  let(:dreamer) { FactoryGirl.create(:dreamer) }

  describe "GET /" do
    context 'user is not logged in' do
      it "renders the welcome page" do
        get :index
        expect(response).to redirect_to welcome_path
      end
    end

    context 'user is logged in' do
      before :each do
        login(dreamer)
        get :index, id: dream.id
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end

    end
  end

  describe "GET #show" do
    context 'user is not logged in' do
      it "renders the welcome page" do
        get :show, id: dream.id
        expect(response).to redirect_to root_path
      end
    end

    context 'user is logged in' do
      before :each do
        login(dreamer)
        get :show, id: dream.id
      end

      it "assigns the requested dream to @dream" do
        expect(assigns(:dream)).to eq dream
      end
      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end
  end

  describe "POST #create" do
    before :each do
      login(dreamer)
      @dreamer_attributes = dreamer.attributes
      @hashtag_string = "what, do, how, this"
    end

    it "saves the new valid dream" do
      expect{
        post :create, dream: FactoryGirl.attributes_for(:dream)
      }.to change(Dream,:count).by(1)
    end

    it "parses and assigns new hashtags" do
      expect{
        post :create, dream: FactoryGirl.attributes_for(:dream).merge(hashtag_string: @hashtag_string)
        }.to change{Dream.all.last.hashtags.count}.by(4)
    end

    it "does not save new invalid dream" do
      expect{
        post :create, dream: @dreamer_attributes.merge(title: nil), format: :js
      }.to_not change(Dream,:count)
    end

    it "redirects to dreams index if valid" do
      post :create, dream: FactoryGirl.attributes_for(:dream)
      expect(response).to render_template "dreams/_dream"
    end

    it "re-directs to new_dream_path if invalid" do
      post :create, dream: @dreamer_attributes.merge(title: nil), format: :js
      expect(response).to have_http_status(400)
    end
  end

  describe "PATCH #update" do
    before :each do
      login(dreamer)
      @dream = FactoryGirl.create(:dream)
      @attributes = FactoryGirl.attributes_for(:dream)
      @invalid_attributes = FactoryGirl.attributes_for(:invalid_dream)
      @hashtag_string = "what, do, how, this"
    end

    it "updates the dream if valid" do
      put :update, id: @dream, dream: @attributes
      @dream.reload
      expect(@dream.title).to eq(@attributes[:title])
      expect(@dream.story).to eq(@attributes[:story])
    end

    it "parses and assigns new hashtags" do
      expect{
        post :update, id: @dream, dream: @attributes.merge(hashtag_string: @hashtag_string)
        @dream.reload
        }.to change{@dream.hashtags.count}.by(4)
    end

    it "does not update the dream if invalid" do
      dream = Dream.create(@attributes)
      put :update, id: dream, dream: @invalid_attributes, format: :js
      @dream.reload
      expect(dream.title).to eq(@attributes[:title])
      expect(dream.story).to eq(@attributes[:story])
    end

    it "responds with 200 if valid" do
      put :update, id: @dream, dream: @attributes
      @dream.reload
      expect(response).to have_http_status(200)
    end

    it "renders response code 400 if invalid" do
      put :update, id: @dream, dream: @invalid_attributes, format: :js
      @dream.reload
      expect(response).to have_http_status(400)
    end

  end

  describe "DELETE #destroy" do
    before :each do
      login(dreamer)
      @dream = FactoryGirl.create(:dream)
    end

    it "deletes dream" do
      expect{
        delete :destroy, id: @dream
      }.to change(Dream,:count).by(-1)
    end
  end
end
