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
end
