FactoryGirl.define.do
	
	factory :photos do |f|
		f.album_name "Happiness"
		f.name "Happy"
		f.description "Happened at sister's engagement"
		f.created_at "2014-05-05"
		f.updated_at "2014-05-05"
	end

	factory :invalid_photos, class: Photo do |f|
		f.album_name nil
		f.name nil
	end
end