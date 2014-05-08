require 'spec_helper'

describe User do 

# it should not start with zero users
	it 'should exist' do
		u = User.new
		u.should_not eq(nil)
	end

# it should test for presence of email
  it 'should be invalid without an email' do	
  	u = User.new
  	u.should_not be_valid
	end

# it should test for uniqueness of email
	it 'should be invalid without a unique email' do
		u = User.new
		u.should_not be_valid
	end

end

# it should require users to log in 
# it should let users see their page when logged in
# otherwise, it should require users to create a new account
# it should convert the password into a secure string
# it should allow users to log out

# from model:
# 	has_secure_password
# 	# validates_presence_of :name
# 	validates_presence_of :email
# 	validates_uniqueness_of :email
# 	validates_presence_of :password
# 	validates_confirmation_of :password