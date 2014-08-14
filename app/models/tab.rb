class Tab < ActiveRecord::Base
  has_many :subtab
  def name
  	I18n.locale.to_s.eql?("no") ? self.name_no : self.name_en
  end
end
