FactorGirl.define.do
	
	factory :tags do |f|
		f.name "Happy"
		f.tagged True
		f.created_at "2014-05-05"
		f.updated_at "2014-05-05"	
	end

	factory :invalid_tags, class: Tag do |f|
		f.name nil
	end
end