class Photo < ActiveRecord::Base
	has_and_belongs_to_many :tags
	has_many :comments, as: :commentable
end