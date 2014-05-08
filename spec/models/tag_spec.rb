require 'spec_helper'

describe Tag do 

# it should not start with zero tags
	it 'should exist' do
		t = Tag.new
		t.should_not eq(nil)
	end

# it should belong to taggable
	it 'should belong to a taggable' do
		u = User.new
		u.email = "email@email.com"
		u.save
		t = tags.build
		t.save
		t.taggable.should_not eq(nil)
	end

end