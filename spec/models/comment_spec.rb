require 'spec_helper'

describe Comment do 

# it should start not start with zero comments
	it 'should exist' do
		c = Comment.new
		c.should_not eq(nil)
	end

# it should belong to commentable
	it 'should belong to a commentable' do
		u = User.new
		u.email = "email@email.com"
		u.save
		c = comments.build
		c.save
		c.commentable.should_not eq(nil)
	end
	
end