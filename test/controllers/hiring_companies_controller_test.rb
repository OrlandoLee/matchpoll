require 'test_helper'

class HiringCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hiring_company = hiring_companies(:one)
  end

  test "should get index" do
    get hiring_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_hiring_company_url
    assert_response :success
  end

  test "should create hiring_company" do
    assert_difference('HiringCompany.count') do
      post hiring_companies_url, params: { hiring_company: { description: @hiring_company.description, name: @hiring_company.name, url: @hiring_company.url } }
    end

    assert_redirected_to hiring_company_url(HiringCompany.last)
  end

  test "should show hiring_company" do
    get hiring_company_url(@hiring_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_hiring_company_url(@hiring_company)
    assert_response :success
  end

  test "should update hiring_company" do
    patch hiring_company_url(@hiring_company), params: { hiring_company: { description: @hiring_company.description, name: @hiring_company.name, url: @hiring_company.url } }
    assert_redirected_to hiring_company_url(@hiring_company)
  end

  test "should destroy hiring_company" do
    assert_difference('HiringCompany.count', -1) do
      delete hiring_company_url(@hiring_company)
    end

    assert_redirected_to hiring_companies_url
  end
end
