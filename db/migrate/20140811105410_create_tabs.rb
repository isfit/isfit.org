class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
    	t.string :name_en
    	t.string :name_no
    	t.string :tag
    	t.integer :order
    	t.string :icon
    	t.boolean :deleted
    	t.timestamps

    end
  end
end
