class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :description
      t.references :howto_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
