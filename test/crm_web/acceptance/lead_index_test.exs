defmodule CrmWeb.Acceptance.LeadIndexTest do
  use Crm.DataCase
  use Hound.Helpers

  hound_session()

  test "presence of new lead button" do
    navigate_to("/leads")

    button = find_element(:css, ".btn-custom a") |> visible_text()
    assert button == "New Lead"
  end
end
