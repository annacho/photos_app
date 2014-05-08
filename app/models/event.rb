class Event < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable
	# has_and_belongs_to_many :photos

	accepts_nested_attributes_for :comments, allow_destroy: true
end