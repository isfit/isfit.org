class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml

  def index
    #@articles = Article.where("(show_article <='"+Time.now.strftime("%Y-%m-%d %H:%M:%S")+"' OR show_article IS NULL)").where(deleted: 0).where(list: 1).order("weight DESC").limit(5)
    #if Language.to_s =="en"
    #  @articles.reject!{|x| x.title_en == "" }
    #else
    #  @articles.reject!{|x| x.title_no == "" }
    #end
    #@latest = @articles

    #render layout: "application_no_boxes"
    redirect_to root_path
  end

  def archive
    @articles.all
  end

  # GET /articles/all
  # GET /articles/all.xml
  def all
    @blog = false
    @articles = get_all_articles(@blog).paginate(:page => params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end
  def all_blog
    @blog = true
    @articles = get_all_articles(@blog).paginate(:page => params[:page], per_page: 10)
    render 'articles/all'
  end
  def latest_blogpost
    @article = Article.where(blog: 1).order("created_at").last

    respond_to do |format|
      format.html{render 'show'} # show.html.erb
      format.xml  { render :xml => @article }
    end
  end 

  def blog
    @blog_posts = Article.blog_articles(Language.to_s)

    render layout: "application_no_boxes"
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.where(:id=>params[:id]).where("(show_article <='"+Time.now.strftime("%Y-%m-%d %H:%M:%S")+"' OR show_article IS NULL) AND deleted='0'AND list='1'").first
    if !@article
      flash[:alert] = 'Article not found'
      redirect_to articles_path
      return
    end
    #@article = Article.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  private
  def get_all_articles blog
    if I18n.locale.to_s =="en"
      Article.where("(show_article <='"+Time.now.strftime("%Y-%m-%d %H:%M:%S")+"' OR show_article IS NULL) AND deleted='0'AND list='1' AND title_en != '' AND blog='" + (blog ? 1.to_s : 0.to_s) + "'").order("id DESC").all
    else
      Article.where("(show_article <='"+Time.now.strftime("%Y-%m-%d %H:%M:%S")+"' OR show_article IS NULL) AND deleted='0'AND list='1' AND title_no != '' AND blog='" + (blog ? 1.to_s : 0.to_s) + "'").order("id DESC").all
    end
  end
end
