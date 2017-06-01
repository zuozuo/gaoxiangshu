require 'test_helper'

class CustomerServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_service = customer_services(:one)
  end

  test "should get index" do
    get customer_services_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_service_url
    assert_response :success
  end

  test "should create customer_service" do
    assert_difference('CustomerService.count') do
      post customer_services_url, params: { customer_service: {  } }
    end

    assert_redirected_to customer_service_url(CustomerService.last)
  end

  test "should show customer_service" do
    get customer_service_url(@customer_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_service_url(@customer_service)
    assert_response :success
  end

  test "should update customer_service" do
    patch customer_service_url(@customer_service), params: { customer_service: {  } }
    assert_redirected_to customer_service_url(@customer_service)
  end

  test "should destroy customer_service" do
    assert_difference('CustomerService.count', -1) do
      delete customer_service_url(@customer_service)
    end

    assert_redirected_to customer_services_url
  end
end
