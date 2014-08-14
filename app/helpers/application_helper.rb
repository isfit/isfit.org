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
end
