class Event < ActiveRecord::Base
	# has_and_belongs_to_many :photos
	has_many :comments, as: :commentable

	accepts_nested_attributes_for :comments, allow_destroy: true
end