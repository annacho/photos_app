class Photo < ActiveRecord::Base
	has_and_belongs_to_many :tags
	# has_and_belongs_to_many :events
	has_many :comments, as: :commentable
	mount_uploader :image, ImageUploader

	accepts_nested_attributes_for :comments, allow_destroy: true
end