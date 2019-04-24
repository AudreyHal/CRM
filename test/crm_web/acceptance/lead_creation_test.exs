defmodule CrmWeb.Acceptance.LeadIndexTest do
  use Crm.DataCase
  use Hound.Helpers

  hound_session()

  test "presence of new lead button" do
    navigate_to("/leads")

    find_element(:css, ".btn-custom a") |> click
    assert current_path() == "/leads/new"
  end

  test "presence of form" do
    navigate_to("/leads")

    find_element(:css, ".btn-custom a") |> click
    form = find_element(:tag, "form")

    assert element_displayed?(form)
  end

  test "presence of create lead button" do
    navigate_to("/leads")

    find_element(:css, ".btn-custom a") |> click
    button = find_element(:css, ".btn-custom") |> visible_text()

    assert button == "Create Lead"
  end

  test "create account with invalid data" do
    navigate_to("/leads")

    find_element(:css, ".btn-custom a") |> click
    find_element(:css, ".btn-custom") |> click

    assert
  end

end
