module ApplicationHelper
	def tabs
		Tab.all.order(:order)
	end
	def nav_link(link_text, link_path)
	  class_name = current_page?(link_path) ? 'active' : 'tabs'

	  content_tag(:li, :class => class_name) do
	    link_to link_text, link_path
	  end
	end
	def language_logo
		I18n.locale.to_s.eql?("no") ? "english-logo" : "norwegian-logo" 
	end
	def language_link
		I18n.locale.to_s.eql?("no") ? "?locale=en" : "?locale=no"
	end

end
