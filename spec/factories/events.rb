FactoryGirl.define.do
	
	factory :events do |f|
		f.content "Dad went wild"
		f.commentable_id "1"
		f.commentable_type "Event"
		f.created_at "2014-05-05"
		f.updated_at "2014-05-05"
	end

	factory :invalid_comments, class: Event do |f|
		f.content nil
	end
end