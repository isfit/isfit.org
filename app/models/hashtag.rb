class Hashtag < ActiveRecord::Base
	has_many :article_hashtags
  has_many :articles, through: :articles_hashtags
end
