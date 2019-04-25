defmodule CrmWeb.Acceptance.AccountpageTest do
  use Crm.DataCase
  use Hound.Helpers
  hound_session()




  test "succesfully navigate to account page" do

      navigate_to("/accounts")


      table = find_element(:css, ".table")
      name = find_within_element(table, :css, ".name") |> visible_text()
      assignee= find_within_element(table, :css, ".assignee") |> visible_text()
      category = find_within_element(table, :css, ".category") |> visible_text()
      number = find_within_element(table, :css, ".number") |> visible_text()
      city  = find_within_element(table, :css, ".city") |> visible_text()
      rating = find_within_element(table, :css, ".rating") |> visible_text()

      button=find_element(:css, ".btn")|> visible_text()
      assert name  == "Name"
      assert assignee == "Assigned to"
      assert category == "Category"
      assert number == "Phone Number"
      assert city == "City"
      assert rating == "Rating"


  end




  test "navigate to create account page on button click" do
    navigate_to("/accounts")
    button= find_element(:class, "acc_btn")|> click
    assert current_path() == "/accounts/new"
  end

  
end
