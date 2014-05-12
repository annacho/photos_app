require 'spec_helper'

describe CommentsController do	

	let(:user) { FactoryGirl.create(:user) }

	describe "GET #index" do

		context 'photo comment' do
			it 'assigns collection of photo comments' do
				login(user)
				photo = FactoryGirl.create(:photo)
				comment = FactoryGirl.create(:comment)
				photo.comments << comment
				get :index, photo_id: photo.id
				expect(assigns(:comments).first)).to eq comment
			end	
		
			it 'renders the index page' do
				login(user)
				get :index
				response.should render_template :index
			end
		end

		context 'event comment' do
			it 'assigns collection of event comments' do
				login(user)
				event = FactoryGirl.create(:event)
				comment = FactoryGirl.create(:comment)
				event.comments << event
				get :index, photo_id: photo.id
				expect(assigns(:events).first)).to eq event
			end	
		
			it 'renders the index page' do
				login(user)
				get :index
				response.should render_template :index
			end
		end
	end

	describe "GET #new" do	

		it "assigns @comment with a new comment" do
      login(user)
      event = FactoryGirl.create(:event)
      get :new, event_id: event.id
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it "renders the new page" do
      login(user)
      event = FactoryGirl.create(:event)
      get :new, event_id: event.id
      response.should render_template :new
    end
	end

  describe "post #create" do

    context "photo comment" do

      it "creates a new photo comment" do
        login(user)
        photo = FactoryGirl.create(:photo)
        expect{

          post :create, photo_id: photo.id, comment: FactoryGirl.attributes_for(:comment)

        }.to change(Comment, :count).by(1)
      end

      it "redirects to the photo show page" do
        login(user)
        photo = FactoryGirl.create(:photo)
        post :create, photo_id: photo.id, comment: FactoryGirl.attributes_for(:comment)
        response.should redirect_to photo_path(photo)
      end
    end

    context "event comment" do

      it "creates a new event comment" do
        login(user)
        event = FactoryGirl.create(:event)
        expect{

          post :create, event_id: event.id, comment: FactoryGirl.attributes_for(:comment)

        }.to change(Comment, :count).by(1)
      end

      it "redirects to the event show page" do
        login(user)
        event = FactoryGirl.create(:event)
        post :create, event_id: event.id, comment: FactoryGirl.attributes_for(:comment)
        response.should redirect_to event_path(event)
      end
    end
  end
  
end