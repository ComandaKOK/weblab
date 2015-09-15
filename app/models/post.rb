class Post < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }
	
	validates :title,  presence: true
	validates :text,   presence: true
	validates :author, presence: true
end
