class RemoveTagFromTabs < ActiveRecord::Migration
  def change
  	remove_column :tabs, :tag, :string
    remove_column :tabs, :tag_no, :string
  end
end
