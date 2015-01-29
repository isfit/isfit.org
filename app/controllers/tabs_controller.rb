class TabsController < ApplicationController
	def show

		#@tab = Tab.find_by_url(params[:id])
		@tab = Tab.find_by(tag_en: params[:id])
		if I18n.locale.to_s.eql?("no")
			@pages = Page.order(:tab_weight).where("tab_id = #{@tab.id} AND title_no > '' AND deleted != 1")
		elsif I18n.locale.to_s.eql?("en")
      @pages = Page.order(:tab_weight).where("tab_id = #{@tab.id} AND title_en > '' AND deleted != 1")
		end
			

    #if @page.id == 28
     # render :layout => 'application_no_boxes'
      #return
    #elsif @page.id == 10
     # render :layout => false
      #return
    #end
	end

	def jubileum
	end
	def buy_jubilee_ticket
	end
	def buy_book
	end
	def show_tab_page
	end
	def redirect_page
		@page = Page.find_by(id: params[:id])
		if @page.tab_id.nil?
			redirect_to root_path
		else
			@tab = Tab.find_by(id: @page.tab_id)
			path = tab_path(@tab)
			if path
			  redirect_to "#{path}\##{@page.id}"
			else
				redirect_to root_path
			end
		end
	end
end
