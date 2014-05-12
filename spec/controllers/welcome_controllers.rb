require 'spec_helper'

describe WelcomeController do
  
  let(:user) { FactoryGirl.create(:user) }

  describe "get #index" do

    context "user logged out" do
      it "assigns a collection of photos" do
        get :index
        expect(assigns(:photos)).to be_empty
      end

      it "renders the index page" do
        get :index
        response.should render_template :index
      end
    end

    context "user logged in" do
      it "assigns a collection of photos" do
        login(user)
        photo = FactoryGirl.create(:photo)
        get :index
        expect(assigns(:photos)[0]).to eq photo
      end

      it "renders the index page" do
        login(user)
        get :index
        response.should render_template :index
      end
    end

  end
end