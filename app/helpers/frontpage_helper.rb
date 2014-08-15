module FrontpageHelper
  def parse_instagram_url
    jobject = JSON.load(open("https://api.instagram.com/v1/users/237941793/media/recent/?client_id=802d634befd6476c80cc18dbee1ce8e0"))
    imageArray = Array.new(4)
    i = 0
    jobject["data"].each do |data|
      begin
        jObject2 = data["images"]
        imageArray[i] = jObject2["standard_resolution"]["url"]
        i += 1
        if i == 4
          return imageArray
        end
      rescue

      end
    end
    imageArray
  end
end
