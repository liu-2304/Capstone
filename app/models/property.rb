class Property < ActiveRecord::Base
  belongs_to :material
  
  attr_accessible :density, :elastic_modulus, :shear_modulus, :poissons_strength, :yield_strength,
:ultimate_tensile_strength, :ultimate_total_elongation, :hardness_value, :melting_point, 
:thermal_conductivity, :specific_heat, :electrical_resistivity, :chemical_composition

end
