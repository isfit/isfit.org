class FrontpageController < ApplicationController
	def frontpage_site
		@articles = Article.frontpage_articles(I18n.locale.to_s)
	end
end
