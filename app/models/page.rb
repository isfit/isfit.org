class Page < ActiveRecord::Base
	self.primary_key = :id
	has_and_belongs_to_many :tabs
	def title
		I18n.locale.to_s.eql?("no") ? self.title_no : self.title_en
	end
	def ingress
		I18n.locale.to_s.eql?("no") ? self.ingress_no : self.ingress_en
	end
	def body
		I18n.locale.to_s.eql?("no") ? self.body_no : self.body_en
	end
	def to_param
		title_en
	end
end
