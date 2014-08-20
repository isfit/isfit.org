class AddTagBothLanguagesToTabs < ActiveRecord::Migration
  def change
  	add_column :tabs, :tag_no, :string
  	add_column :tabs, :tag_en, :string
  end
end
