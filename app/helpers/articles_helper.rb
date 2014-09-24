module ArticlesHelper
  def article_image(picture_id, type, link)
    picture = Photo.find_by_id(picture_id)
    return "" unless picture
    style = case type
              when "1" then "photo_full"
              when "2" then "photo_right"
              when "3" then "photo_left"
            end

    img_text = Language.to_s == "en" ? picture.image_text_en : picture.image_text_no
    pic_url = type == "1" ? picture.full_article_picture.url : picture.half_article_picture.url
    #Change on prod!
    if (link)
      url = "<a href=/assets/#{picture.original_picture.url}><div class=#{style}><img src =/assets/#{pic_url}  /><br /><i>Foto: #{picture.credits}</i><br /><i>#{picture.image_text_en}</i></div></a>"
    else
      url = "<div class=#{style}><img src =/assets/#{pic_url}  /><br /><i>Foto: #{picture.credits}</i><br /><i>#{picture.image_text_en}</i></div>"
    end
  end
  def display_tag

    if ArticleHashtag.where(article_id: @article.id).empty?
      return nil
    else
      tag_id = ArticleHashtag.where(article_id: @article.id)
      tag_ids = []
      tag_id.each do |t_id|
        tag_ids << Hashtag.where(id: t_id.hashtag_id).first
      end 
      s = ''
      tag_ids.each do |t|
        s << (link_to t.hashtag, hashtag_path(t.hashtag))
        s << ' '
      end
      return s.html_safe
      #return link_to tag, hashtag_path(tag)
    end
  end
end
