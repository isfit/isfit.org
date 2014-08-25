class Tab < ActiveRecord::Base
  has_many :pages
  before_save :sluggify
  def name
  	I18n.locale.to_s.eql?("no") ? self.name_no : self.name_en
  end
  def sluggify
  	if I18n.locale.to_s.eql?("no") 
  		self.slug = self.name_no.parameterize
  	else
  		self.slug = self.name_en.parameterize
  	end
  end
  def to_param
   	name_en.parameterize
  end
end
