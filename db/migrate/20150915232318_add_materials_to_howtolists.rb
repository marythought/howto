class AddMaterialsToHowtolists < ActiveRecord::Migration
  def change
    add_column :howto_lists, :materials, :text
  end
end
