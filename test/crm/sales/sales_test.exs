defmodule Crm.SalesTest do
  use Crm.DataCase

  alias Crm.Sales

  describe "accounts" do
    alias Crm.Sales.Account

    @valid_attrs %{address: "some address", assignee: "some assignee", category: "some category", city: "some city", country: "some country", email: "some email", name: "some name", phone: "some phone", rating: 42, tags: "some tags", website: "some website", zipcode: 42}
    @update_attrs %{address: "some updated address", assignee: "some updated assignee", category: "some updated category", city: "some updated city", country: "some updated country", email: "some updated email", name: "some updated name", phone: "some updated phone", rating: 43, tags: "some updated tags", website: "some updated website", zipcode: 43}
    @invalid_attrs %{address: nil, assignee: nil, category: nil, city: nil, country: nil, email: nil, name: nil, phone: nil, rating: nil, tags: nil, website: nil, zipcode: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Sales.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Sales.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Sales.create_account(@valid_attrs)
      assert account.address == "some address"
      assert account.assignee == "some assignee"
      assert account.category == "some category"
      assert account.city == "some city"
      assert account.country == "some country"
      assert account.email == "some email"
      assert account.name == "some name"
      assert account.phone == "some phone"
      assert account.rating == 42
      assert account.tags == "some tags"
      assert account.website == "some website"
      assert account.zipcode == 42
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, %Account{} = account} = Sales.update_account(account, @update_attrs)
      assert account.address == "some updated address"
      assert account.assignee == "some updated assignee"
      assert account.category == "some updated category"
      assert account.city == "some updated city"
      assert account.country == "some updated country"
      assert account.email == "some updated email"
      assert account.name == "some updated name"
      assert account.phone == "some updated phone"
      assert account.rating == 43
      assert account.tags == "some updated tags"
      assert account.website == "some updated website"
      assert account.zipcode == 43
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_account(account, @invalid_attrs)
      assert account == Sales.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Sales.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Sales.change_account(account)
    end
  end

  describe "leads" do
    alias Crm.Sales.Lead

    @valid_attrs %{city: "some city", company: "some company", country: "some country", department: "some department", email: "some email", first_name: "some first_name", last_name: "some last_name", phone: "some phone", status: "some status", street: "some street", title: "some title"}
    @update_attrs %{city: "some updated city", company: "some updated company", country: "some updated country", department: "some updated department", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone: "some updated phone", status: "some updated status", street: "some updated street", title: "some updated title"}
    @invalid_attrs %{city: nil, company: nil, country: nil, department: nil, email: nil, first_name: nil, last_name: nil, phone: nil, status: nil, street: nil, title: nil}

    def lead_fixture(attrs \\ %{}) do
      {:ok, lead} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_lead()

      lead
    end

    test "list_leads/0 returns all leads" do
      lead = lead_fixture()
      assert Sales.list_leads() == [lead]
    end

    test "get_lead!/1 returns the lead with given id" do
      lead = lead_fixture()
      assert Sales.get_lead!(lead.id) == lead
    end

    test "create_lead/1 with valid data creates a lead" do
      assert {:ok, %Lead{} = lead} = Sales.create_lead(@valid_attrs)
      assert lead.city == "some city"
      assert lead.company == "some company"
      assert lead.country == "some country"
      assert lead.department == "some department"
      assert lead.email == "some email"
      assert lead.first_name == "some first_name"
      assert lead.last_name == "some last_name"
      assert lead.phone == "some phone"
      assert lead.status == "some status"
      assert lead.street == "some street"
      assert lead.title == "some title"
    end

    test "create_lead/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_lead(@invalid_attrs)
    end

    test "update_lead/2 with valid data updates the lead" do
      lead = lead_fixture()
      assert {:ok, %Lead{} = lead} = Sales.update_lead(lead, @update_attrs)
      assert lead.city == "some updated city"
      assert lead.company == "some updated company"
      assert lead.country == "some updated country"
      assert lead.department == "some updated department"
      assert lead.email == "some updated email"
      assert lead.first_name == "some updated first_name"
      assert lead.last_name == "some updated last_name"
      assert lead.phone == "some updated phone"
      assert lead.status == "some updated status"
      assert lead.street == "some updated street"
      assert lead.title == "some updated title"
    end

    test "update_lead/2 with invalid data returns error changeset" do
      lead = lead_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_lead(lead, @invalid_attrs)
      assert lead == Sales.get_lead!(lead.id)
    end

    test "delete_lead/1 deletes the lead" do
      lead = lead_fixture()
      assert {:ok, %Lead{}} = Sales.delete_lead(lead)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_lead!(lead.id) end
    end

    test "change_lead/1 returns a lead changeset" do
      lead = lead_fixture()
      assert %Ecto.Changeset{} = Sales.change_lead(lead)

  describe "opportunities" do
    alias Crm.Sales.Opportunity

    @valid_attrs %{amount: "120.5", assigned_to: "some assigned_to", close_date: ~D[2010-04-17], discount: "some discount", name: "some name", probability: "some probability", stage: "some stage"}
    @update_attrs %{amount: "456.7", assigned_to: "some updated assigned_to", close_date: ~D[2011-05-18], discount: "some updated discount", name: "some updated name", probability: "some updated probability", stage: "some updated stage"}
    @invalid_attrs %{amount: nil, assigned_to: nil, close_date: nil, discount: nil, name: nil, probability: nil, stage: nil}

    def opportunity_fixture(attrs \\ %{}) do
      {:ok, opportunity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_opportunity()

      opportunity
    end

    test "list_opportunities/0 returns all opportunities" do
      opportunity = opportunity_fixture()
      assert Sales.list_opportunities() == [opportunity]
    end

    test "get_opportunity!/1 returns the opportunity with given id" do
      opportunity = opportunity_fixture()
      assert Sales.get_opportunity!(opportunity.id) == opportunity
    end

    test "create_opportunity/1 with valid data creates a opportunity" do
      assert {:ok, %Opportunity{} = opportunity} = Sales.create_opportunity(@valid_attrs)
      assert opportunity.amount == Decimal.new("120.5")
      assert opportunity.assigned_to == "some assigned_to"
      assert opportunity.close_date == ~D[2010-04-17]
      assert opportunity.discount == "some discount"
      assert opportunity.name == "some name"
      assert opportunity.probability == "some probability"
      assert opportunity.stage == "some stage"
    end

    test "create_opportunity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_opportunity(@invalid_attrs)
    end

    test "update_opportunity/2 with valid data updates the opportunity" do
      opportunity = opportunity_fixture()
      assert {:ok, %Opportunity{} = opportunity} = Sales.update_opportunity(opportunity, @update_attrs)
      assert opportunity.amount == Decimal.new("456.7")
      assert opportunity.assigned_to == "some updated assigned_to"
      assert opportunity.close_date == ~D[2011-05-18]
      assert opportunity.discount == "some updated discount"
      assert opportunity.name == "some updated name"
      assert opportunity.probability == "some updated probability"
      assert opportunity.stage == "some updated stage"
    end

    test "update_opportunity/2 with invalid data returns error changeset" do
      opportunity = opportunity_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_opportunity(opportunity, @invalid_attrs)
      assert opportunity == Sales.get_opportunity!(opportunity.id)
    end

    test "delete_opportunity/1 deletes the opportunity" do
      opportunity = opportunity_fixture()
      assert {:ok, %Opportunity{}} = Sales.delete_opportunity(opportunity)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_opportunity!(opportunity.id) end
    end

    test "change_opportunity/1 returns a opportunity changeset" do
      opportunity = opportunity_fixture()
      assert %Ecto.Changeset{} = Sales.change_opportunity(opportunity)
    end
  end

  describe "contacts" do
    alias Crm.Sales.Contact

    @valid_attrs %{city: "some city", country: "some country", department: "some department", email: "some email", first_name: "some first_name", last_name: "some last_name", phone: "some phone", street: "some street", title: "some title"}
    @update_attrs %{city: "some updated city", country: "some updated country", department: "some updated department", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone: "some updated phone", street: "some updated street", title: "some updated title"}
    @invalid_attrs %{city: nil, country: nil, department: nil, email: nil, first_name: nil, last_name: nil, phone: nil, street: nil, title: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_contact()

      contact
    end

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Sales.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Sales.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Sales.create_contact(@valid_attrs)
      assert contact.city == "some city"
      assert contact.country == "some country"
      assert contact.department == "some department"
      assert contact.email == "some email"
      assert contact.first_name == "some first_name"
      assert contact.last_name == "some last_name"
      assert contact.phone == "some phone"
      assert contact.street == "some street"
      assert contact.title == "some title"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{} = contact} = Sales.update_contact(contact, @update_attrs)
      assert contact.city == "some updated city"
      assert contact.country == "some updated country"
      assert contact.department == "some updated department"
      assert contact.email == "some updated email"
      assert contact.first_name == "some updated first_name"
      assert contact.last_name == "some updated last_name"
      assert contact.phone == "some updated phone"
      assert contact.street == "some updated street"
      assert contact.title == "some updated title"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_contact(contact, @invalid_attrs)
      assert contact == Sales.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Sales.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Sales.change_contact(contact)
    end
  end
end
