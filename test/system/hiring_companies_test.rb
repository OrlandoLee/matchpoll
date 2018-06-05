require "application_system_test_case"

class HiringCompaniesTest < ApplicationSystemTestCase
  setup do
    @hiring_company = hiring_companies(:one)
  end

  test "visiting the index" do
    visit hiring_companies_url
    assert_selector "h1", text: "Hiring Companies"
  end

  test "creating a Hiring company" do
    visit hiring_companies_url
    click_on "New Hiring Company"

    fill_in "Description", with: @hiring_company.description
    fill_in "Name", with: @hiring_company.name
    fill_in "Url", with: @hiring_company.url
    click_on "Create Hiring company"

    assert_text "Hiring company was successfully created"
    click_on "Back"
  end

  test "updating a Hiring company" do
    visit hiring_companies_url
    click_on "Edit", match: :first

    fill_in "Description", with: @hiring_company.description
    fill_in "Name", with: @hiring_company.name
    fill_in "Url", with: @hiring_company.url
    click_on "Update Hiring company"

    assert_text "Hiring company was successfully updated"
    click_on "Back"
  end

  test "destroying a Hiring company" do
    visit hiring_companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hiring company was successfully destroyed"
  end
end
