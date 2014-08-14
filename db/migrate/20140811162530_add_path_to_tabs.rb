class AddPathToTabs < ActiveRecord::Migration
  def change
 	add_column :tabs, :path, :string
  end
end
