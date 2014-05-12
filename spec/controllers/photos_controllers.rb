require 'spec_helper'

describe PhotosController do	

	let(:user) { FactoryGirl.create(:user) }

	describe "GET #index" do
		it 'assigns collection of photos' do
			login(user)
			photo = FactoryGirl.create(:photo)
			current_user.photos << photo
			get :index
			expect(assigns(:photos)).to eq photo
		end	
	
		it 'renders the index page' do
			login(user)
			get :index
			response.should render_template :index
		end
	end

	describe "GET #new" do	
		it "assigns @new_photo with a new photo" do
      login(user)
      get :new
      expect(assigns(:new_photo)).to be_a_new(Photo)
    end

    it "renders the new page" do
      login(user)
      get :new
      response.should render_template :new
    end
	end

  describe "POST #create" do
    context "valid photos" do
      it "creates a new photo" do
        login(user)
        photo = FactoryGirl.create(:photo)
        expect{

          post :create, photo: FactoryGirl.attributes_for(:photo)

        }.to change(Photo, :count).by(1)
      end
    end

    context "invalid photos" do
      it "redirects to index" do
        login(user)
        post :create, photo: event_attrs
        response.should redirect_to photos_path
      end
		end
	end

  describe 'GET #show' do
  	it 'assigns collection of photos' do
  		photo = FactoryGirl.create(:photo)
  		get :show, id: photo.id
  		assigns(:photo).should eq(photo)
  	end
  end

	describe "GET #edit" do
    it "assigns @photo with specified photo" do
      login(user)
      photo = FactoryGirl.create(:photo)
      get :edit, id: photo
      expect(assigns(:photo)).to eq photo
    end

    it "renders the edit page" do
      login(user)
      photo = FactoryGirl.create(:photo)
      get :edit, id: photo
      response.should render_template :edit
    end
  end

  describe "PUT #update" do
    it "updates photo with specified attributes" do
      login(user)
      photo = FactoryGirl.create(:photo)
      put :update, id: photo, :photo => {name: "updated_name"}
      updated_photo = Photo.find(photo.id)
      expect(updated_photo.name).to eq "updated_name"
    end

    it "redirects to the edit page" do
      login(user)
      photo = FactoryGirl.create(:photo)
      put :update, id: photo, :photo => {name: "updated_name"}
      response.should redirect_to "/photos/#{photo.id}"
    end
  end

  # describe 'put update' do
  # 	it 'should update photo' do
  # 		photo = FactoryGirl.create(:photo)
  # 		put :update, id: photo.id, photo:{photo_name: "classroom"}
  # 		assigns(:photo).photo_name.should eq("classroom")
  # 	end
  # end

  describe "DELETE #destroy" do
    it "updates photo with specified attributes" do
      login(user)
      photo = FactoryGirl.create(:photo)
      expect { 
                delete :destroy, id: photo

              }.to change(Photo, :count).by(-1)
    end

    it "redirects to the photos index page" do
      login(user)
      photo = FactoryGirl.create(:photo)
      delete :destroy, id: photo
      response.should redirect_to photos_path
    end
  end
  
end