class Comment < ActiveRecord::Base
	belongs_to :blog

	validates_presence_of :name, :content
	validates_uniqueness_of :name
	#This restricts each user to only one comment per blog entry

	validates :blog_id, numericality: {only_integer: true}
end
