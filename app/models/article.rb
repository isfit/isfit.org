class Article < ActiveRecord::Base
  self.primary_key = 'id'
  #lang_attr :title, :ingress, :body, :sub_title

  has_attached_file :frontend_article_image, styles:  {
    frontpage_large: {geometry: "620x362#", processors: [:cropper] },
    article_large: {geometry: "940x480#", processors: [:cropper_half] }
  },
  url: "/system/frontend_articles/:attachment/:id_partition/:style/:filename",
  path: ":rails_root/public/system/frontend_articles/:attachment/:id_partition/:style/:filename"

  def self.frontpage_articles language
		articles = visible_articles.where(blog: 0)

    if language.eql? "en"
      articles = articles.where("title_en > ''")
    else
      articles = articles.where("title_no > ''")
    end

    @articles = articles.order("weight DESC").limit(3)
  end

  def self.blog_articles language
    articles = visible_articles.where(blog: 1)

    if language.eql? "en"
      articles = articles.where("title_en > ''")
    else
      articles = articles.where("title_no > ''")
    end

    @articles = articles.order("weight DESC")
  end

  def title
  	I18n.locale.to_s.eql?("no") ? self.title_no : self.title_en
  end
  def sub_title
  	I18n.locale.to_s.eql?("no") ? self.sub_title_no : self.sub_title_en
  end
  def ingress
    I18n.locale.to_s.eql?("no") ? self.ingress_no : self.ingress_en
  end
  def body
    I18n.locale.to_s.eql?("no") ? self.body_no : self.body_en
  end

  private
  def self.visible_articles
    Article
      .where("(show_article <='"+Time.now.strftime("%Y-%m-%d %H:%M:%S")+"' OR show_article IS NULL)")
      .where(deleted: 0)
      .where(list: 1)
  end
end
