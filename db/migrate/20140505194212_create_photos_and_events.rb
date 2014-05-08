class CreatePhotosAndEvents < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.string :name
    	t.string :description
    	t.string :person
    	t.string :photo
    	t.datetime :datetime
    	t.string :album_name
    	t.string :album_description
    	t.boolean :albumed, default: false
    	t.datetime :created_at
    	t.datetime :updated_at
    end

    create_table :events do |t|
    	t.string :name
    	t.string :description
    	t.string :person
    	t.string :location
    	t.datetime :datetime
    	t.datetime :created_at
    	t.datetime :updated_at
    end

  	create_table :users do |t|
  		t.string :name
  		t.string :type
  		t.string :username
  		t.string :email
  		t.string :password
  		t.datetime :created_at
  		t.datetime :updated_at
  	end

  	create_table :tags do |t|
  		t.string :name
  		t.boolean :tagged, default: false
  		t.datetime :created_at
  		t.datetime :updated_at
		end

    create_table :photos_tags, id: false do |t|
    	t.integer :photo_id
    	t.integer :tag_id
  	end
	end
end