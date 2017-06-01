class Comment < ApplicationRecord
	belongs_to :commenter, class_name: 'User', foreign_key: :commenter_id
	belongs_to :post
end
