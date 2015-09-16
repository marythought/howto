class CreateHowtoLists < ActiveRecord::Migration
  def change
    create_table :howto_lists do |t|
      t.string :name
      t.string :author

      t.timestamps null: false
    end
  end
end
