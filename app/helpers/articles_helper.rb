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
end
