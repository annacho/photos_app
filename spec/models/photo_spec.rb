require 'spec_helper'

describe Photo do 

# it should not start with zero photos
	it 'should exist' do
		p = Photo.new
		p.should_not eq(nil)
	end

# it should allow users to create new photos
	it 'should be invalid without photo upload' do
		p = Photo.new
		p.should_not be_valid
	end

end

# not sure if i should be testing for other functions such as the following:
# it should allow users to describe photos
# it should allow users to upload image files
# it should allow users to save photo details
# it should allow users to edit photo details
# it should allow users to add comments
# it should allow users to delete comments
# it should allow users to add tags
# it should allow users to delete tags
# it should allow users to delete photos

