class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.float :density
      t.float :elastic_modulus
      t.float :shear_modulus
      t.float :poissons_strength
      t.float :yield_strength
      t.float :ultimate_tensile_strength
      t.float :ultimate_total_elongation
      t.float :hardness_value
      t.float :melting_point
      t.float :thermal_conductivity
      t.float :specific_heat
      t.float :electrical_resistivity
      t.float :chemical_composition

      t.timestamps null: false
    end
  end
end
