require 'spec_helper'

describe Event do 

# it should not start with zero events
	it 'should exist' do
		e = Event.new
		e.should_not eq(nil)
	end

end

# not sure if i should be testing for other functions such as the following:
# it should allow users to create new events
# it should allow users to describe events
# it should allow users to save event details
# it should allow users to edit event details
# it should allow users to add comments
# it should allow users to delete comments
# it should allow users to add tags
# it should allow users to delete tags
# it should allow users to delete events
