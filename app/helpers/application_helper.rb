module ApplicationHelper
	def tabs
		Tab.all.order(:weight).where('deleted != 1')
	end
	def nav_link(link_text, link_path, tab_id, tab, index)
		if(link_path.eql?('tabs'))
			new_link_path = link_path      
      class_name = current_page?((tab_path(tab))) ? 'current' : 'tabs'

			content_tag(:li, :class => class_name) do
	    	link_to link_text, tab_path(tab)
	  	end
		else
			new_link_path = link_path
      if index == 0
			 class_name = current_page?(new_link_path.to_sym) ? 'current first' : 'tabs first'
      else
        class_name = current_page?(new_link_path.to_sym) ? 'current' : 'tabs'
      end
	  	content_tag(:li, :class => class_name) do
	    	link_to link_text, new_link_path.to_sym
	  	end
		end
	end
  def norwegian?
    I18n.locale.to_s.eql?("no")
  end
	def language_logo
		I18n.locale.to_s.eql?("no") ? "english-logo" : "norwegian-logo" 
	end
	def language_link
		I18n.locale.to_s.eql?("no") ? "?locale=en" : "?locale=no"
	end
	def format(str)
    set_correct_tags(str)
    yt_tag(str)
    reg = Regexp.new(/\[([\w ,:"]+)\]\(([A-Za-z0-9_:.=&+-?\/]+)\)/)
    str.gsub!(reg, "<a href=\"\\2\" target=\"_blank\">\\1</a>")

    bc = BlueCloth.new(str) 
    #str.gsub!(/([^>])\s*\r\n\r\n\s*([^<])/m, "\\1<br /><br />\\2")
    #str.gsub!(/([^>])\s*\r\n\s*([^<])/m, "\\1<br />\\2")
    #str

    text = bc.to_html
    #set_correct_tags(text)
    text
  end

  def set_correct_tags(text)
    # text.gsub!(/##pic (\d+) (\d+) pic##/) {|match|  article_image($1, $2, false)}
    # text.gsub!(/#l#pic (\d+) (\d+) pic#l#/) {|match| article_image($1, $2, true)}
  end

  def yt_tag(text)
    text.gsub!(/##yt (\w+) yt##/, "<iframe id='ytplayer' type='text/html' width='580' height='302' src='http://www.youtube.com/embed/\\1?showinfo=0&controls=0' frameborder='0' allowfullscreen></iframe>")
  end
  def is_contact_or_info tab
  	name = tab.name
  	if name.eql?("Contact") || name.eql?("Kontakt")
  		@contact_tab = tab
  		return true
  	elsif name.eql?("Information") || name.eql?("Informasjon")
  		@info_tab = tab
  		return true
  	end	
  	return false
  end

end
