class Post < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }
	
	validates :image,  presence: true
	validates :title,  presence: true
	validates :text,   presence: true, length: { minimum: 6 }
	validates :author, presence: true
end
