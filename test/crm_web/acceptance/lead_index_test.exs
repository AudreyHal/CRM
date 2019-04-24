defmodule CrmWeb.Acceptance.LeadIndexTest do
  use Crm.DataCase
  use Hound.Helpers

  hound_session()

  test "presence of new lead button" do
    navigate_to("/leads")

    button = find_element(:css, ".btn-custom a") |> visible_text()
    assert button == "New Lead"
  end

  test "presence of table when leads are available" do
    navigate_to("/leads")
  end

  test "presence of error message when leads are absent" do
    navigate_to("/leads")

    text = find_element(:class, "empty-leads") |> visible_text()
    assert text == "No leads created yet."
  end
end
