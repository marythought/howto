class AddImageUrlToHowToLists < ActiveRecord::Migration
  def change
    add_column :howto_lists, :image_url, :string
  end
end
