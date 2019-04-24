defmodule CrmWeb.Acceptance.OpportunityPageTest do
  use MiniCrm.DataCase
  use Hound.Helpers

  hound_session()

  test "presence of create button" do
    navigate_to("/opportunities")
    button = find_element(:class, "acc_btn") |> visible_text()
    assert button == "Create Opportunity"
  end

  test "create button goes to new opportunity creation page" do
    navigate_to("/opportunities")
    find_element(:class, "acc_btn") |> click()
    assert current_path == "/opportunities/new"
  end

  test "create a new opportunity with valid data" do
    navigate_to("/opportunities/new")

    form = find_element(:tag, "form")
    find_within_element(form, :name, "opportunity[name]") |> fill_field("UBA")
    find_within_element(form, :name, "opportunity[stage]") |> fill_field("Fresh")
    find_within_element(form, :name, "opportunity[close_date]") |> fill_field("14-04-2019")
    find_within_element(form, :name, "opportunity[probability]") |> fill_field(5)
    find_within_element(form, :name, "opportunity[amount]") |> fill_field(5000)
    find_within_element(form, :name, "opportunity[discount]") |> fill_field(10)
    find_within_element(form, :name, "opportunity[assigned_to]") |> fill_field("Isioma Queen")
    find_within_element(form, :name, "opportunity[comment]") |> fill_field("Lorem Ipsum")
    find_within_element(form, :name, "opportunity[account_id]") |> fill_field(1)

    find_within_element(form, :css, "btn") |> click

    assert current_path == "/opportunities"
    message = find_element(:class, "alert") |> visible_text()

    assert message == "Opportunity created successfully."
  end

  test "create a new opportunity with invalid data" do
    navigate_to("/opportunity/new")
    form = find_element(:tag, "form")
    find_within_element(form, :css, "button") |> click

    assert current_path == "/opportunities"
    message = find_element(:class, "alert") |> visible_text()

    assert message == "Oops, some fields are empty"
  end
end
