require 'test_helper'

class GasTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gas_type = gas_types(:one)
  end

  test "should get index" do
    get gas_types_url, as: :json
    assert_response :success
  end

  test "should create gas_type" do
    assert_difference('GasType.count') do
      post gas_types_url, params: { gas_type: { name: @gas_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show gas_type" do
    get gas_type_url(@gas_type), as: :json
    assert_response :success
  end

  test "should update gas_type" do
    patch gas_type_url(@gas_type), params: { gas_type: { name: @gas_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy gas_type" do
    assert_difference('GasType.count', -1) do
      delete gas_type_url(@gas_type), as: :json
    end

    assert_response 204
  end
end
