class Feedback < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  default_scope -> { order('created_at DESC') }

  validates :author,  	presence: true,   length: { maximum: 20 }
  validates :email, 	presence: true,   format: { with: VALID_EMAIL_REGEX }
  validates :text,  	presence: true
  validates :adminanswer,  	presence: true
end
