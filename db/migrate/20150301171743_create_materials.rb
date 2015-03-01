class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :material_type

      t.timestamps null: false
    end
  end
end
