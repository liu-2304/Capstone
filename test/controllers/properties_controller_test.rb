require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post :create, property: { chemical_composition: @property.chemical_composition, density: @property.density, elastic_modulus: @property.elastic_modulus, electrical_resistivity: @property.electrical_resistivity, hardness_value: @property.hardness_value, melting_point: @property.melting_point, poissons_strength: @property.poissons_strength, shear_modulus: @property.shear_modulus, specific_heat: @property.specific_heat, thermal_conductivity: @property.thermal_conductivity, ultimate_tensile_strength: @property.ultimate_tensile_strength, ultimate_total_elongation: @property.ultimate_total_elongation, yield_strength: @property.yield_strength }
    end

    assert_redirected_to property_path(assigns(:property))
  end

  test "should show property" do
    get :show, id: @property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property
    assert_response :success
  end

  test "should update property" do
    patch :update, id: @property, property: { chemical_composition: @property.chemical_composition, density: @property.density, elastic_modulus: @property.elastic_modulus, electrical_resistivity: @property.electrical_resistivity, hardness_value: @property.hardness_value, melting_point: @property.melting_point, poissons_strength: @property.poissons_strength, shear_modulus: @property.shear_modulus, specific_heat: @property.specific_heat, thermal_conductivity: @property.thermal_conductivity, ultimate_tensile_strength: @property.ultimate_tensile_strength, ultimate_total_elongation: @property.ultimate_total_elongation, yield_strength: @property.yield_strength }
    assert_redirected_to property_path(assigns(:property))
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete :destroy, id: @property
    end

    assert_redirected_to properties_path
  end
end
