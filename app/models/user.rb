class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :friendships, foreign_key: :first_id
  has_many :friends, source: :second, through: :friendships, foreign_key: :first_id
  has_many :friendships, foreign_key: :second_id
  has_many :friends, source: :first, through: :friendships, foreign_key: :second_id
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :commenter_id
  has_many :notifications
  has_many :likes, foreign_key: :liker_id
  has_many :liked_posts, through: :likes, source: :post, foreign_key: :liker_id

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.email = auth.info.email
  		user.password = Devise.friendly_token[0,20]

  	end
  end

  def self.new_with_session(params, session)
  	super.tap do |user|
  		if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  			user.email = data["email"] if user.email.blank?
  		end
  	end
  end
end
