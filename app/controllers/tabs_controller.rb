class TabsController < ApplicationController
	def show

		#@tab = Tab.find_by_url(params[:id])

		@tab = Tab.find_by(tag_en: params[:id])
		if I18n.locale.to_s.eql?("no")
			@pages = @tab.pages.all.where("title_no > ''")
		elsif I18n.locale.to_s.eql?("en")
			@pages = @tab.pages.all.where("title_en > ''")
		end
			

    #if @page.id == 28
     # render :layout => 'application_no_boxes'
      #return
    #elsif @page.id == 10
     # render :layout => false
      #return
    #end
	end
	def show_tab_page
	end
end
