require 'spec_helper'

describe TagsController do	

	let(:user) { FactoryGirl.create(:user) }

	describe "GET #index" do
		it 'assigns collection of tags' do
			login(user)
			photo = FactoryGirl.create(:photo)
			tag = FactoryGirl.create(:tag)
			photo.tags << tag
			get :index, photo_id: photo.id
			expect(assigns(:tags).first)).to eq tag
		end	
		
    it "renders the index page" do
      login(user)
      photo = FactoryGirl.create(:photo)
      tag = FactoryGirl.create(:tag)
      photo.tags << tag
      get :index, photo_id: photo.id
      response.should render_template :index
    end

  end

  describe "GET #new" do
    it "assigns @new_tag with a new tag" do
      login(user)
      photo = FactoryGirl.create(:photo)
      get :new, photo_id: photo.id
      expect(assigns(:tag)).to be_a_new(Tag)
    end

    it "assigns @current_photo with the specific photo" do
      login(user)
      photo = FactoryGirl.create(:photo)
      get :new, photo_id: photo.id
      expect(assigns(:current_photo)).to eq photo
    end

    it "renders the new page" do
      login(user)
      photo = FactoryGirl.create(:photo)
      get :new, photo_id: photo.id
      response.should render_template :new
    end

  end

  describe "POST #create" do
    it "creates a new tag" do
      login(user)
      photo = FactoryGirl.create(:photo)
      expect{

        post :create, photo_id: photo.id, tag: FactoryGirl.attributes_for(:tag)

      }.to change(Tag, :count).by(1)

    end

    it "redirects to the current photo show page" do
      login(user)
      photo = FactoryGirl.create(:photo)
      post :create, photo_id: photo.id, tag: FactoryGirl.attributes_for(:tag)
      response.should redirect_to photo_path(photo)
    end
  end

end