class ArticleHashtag < ActiveRecord::Base
	belongs_to :article
  belongs_to :hashtag
end
