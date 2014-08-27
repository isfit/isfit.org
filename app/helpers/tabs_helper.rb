module TabsHelper
	def get_workshops
		workshops = Workshop.where(published: true).order("rank ASC").all
	end
	def get_isfit_online
		 isfit_online = IsfitOnline.where("(isfit_onlines.start_date <= \"" + Time.now.strftime("%Y-%m-%d %H:%M:%S\""))
                               .where("isfit_onlines.end_date >= \"" + Time.now.strftime("%Y-%m-%d %H:%M:%S\"") + ")")
                               .first
	end
end
