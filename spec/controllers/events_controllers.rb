require 'spec_helper'

describe EventsController do	

	let(:user) { FactoryGirl.create(:user) }

	describe "GET #index" do
		it 'assigns collection of events' do
			login(user)
			event = FactoryGirl.create(:event)
			current_user.events << event
			get :index
			expect(assigns(:events)).to eq event
		end	
	
		it 'renders the index page' do
			login(user)
			get :index
			response.should render_template :index
		end
	end

	describe "GET #new" do	
		it "assigns @new_event with a new event" do
      login(user)
      get :new
      expect(assigns(:new_event)).to be_a_new(Event)
    end

    it "renders the new page" do
      login(user)
      get :new
      response.should render_template :new
    end
	end

  describe "POST #create" do
    context "valid events" do
      it "creates a new event" do
        login(user)
        event = FactoryGirl.create(:event)
        expect{

          post :create, event: FactoryGirl.attributes_for(:event)

        }.to change(Event, :count).by(1)
      end
    end

    context "invalid events" do
      it "redirects to index" do
        login(user)
        post :create, event: event_attrs
        response.should redirect_to events_path
      end
		end
	end

  describe 'GET #show' do
  	it 'assigns collection of events' do
  		event = FactoryGirl.create(:event)
  		get :show, id: event.id
  		assigns(:event).should eq(event)
  	end
  end

	describe "GET #edit" do
    it "assigns @event with specified event" do
      login(user)
      event = FactoryGirl.create(:event)
      get :edit, id: event
      expect(assigns(:event)).to eq event
    end

    it "renders the edit page" do
      login(user)
      event = FactoryGirl.create(:event)
      get :edit, id: event
      response.should render_template :edit
    end
  end

  describe "PUT #update" d
    it "updates event with specified attributes" do
      login(user)
      event = FactoryGirl.create(:event)
      put :update, id: event, :event => {name: "updated_name"}
      updated_event = Event.find(event.id)
      expect(updated_event.name).to eq "updated_name"
    end

    it "redirects to the edit page" do
      login(user)
      event = FactoryGirl.create(:event)
      put :update, id: event, :event => {name: "updated_name"}
      response.should redirect_to "/events/#{event.id}"
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
    it "updates event with specified attributes" do
      login(user)
      event = FactoryGirl.create(:event)
      expect { 
                delete :destroy, id: event

              }.to change(Event, :count).by(-1)
    end

    it "redirects to the events index page" do
      login(user)
      event = FactoryGirl.create(:event)
      delete :destroy, id: event
      response.should redirect_to events_path
    end
  end

end