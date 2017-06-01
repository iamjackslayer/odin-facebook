class Post < ApplicationRecord
	belongs_to :author, class_name: 'User', foreign_key: :author_id
	has_many :comments
	has_many :likes, foreign_key: :post_id
	has_many :likers, through: :likes, source: :liker, foreign_key: :post_id
end
