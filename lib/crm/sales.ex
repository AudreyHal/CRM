defmodule Crm.Sales do
  import Ecto.Query, warn: false
  alias Crm.Repo
  alias Crm.Sales.{Account, Lead}


  def list_accounts do
    Repo.all(Account)
  end

  def get_account!(id), do: Repo.get!(Account, id)

  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  def change_account(%Account{} = account) do
    Account.changeset(account, %{})
  end

  #---------------------------- Lead --------------------------- #
  def list_leads do
    Repo.all(Lead)
  end

  def get_lead!(id), do: Repo.get!(Lead, id)

  def create_lead(attrs \\ %{}) do
    %Lead{}
    |> Lead.changeset(attrs)
    |> Repo.insert()
  end

  def update_lead(%Lead{} = lead, attrs) do
    lead
    |> Lead.changeset(attrs)
    |> Repo.update()
  end

  def delete_lead(%Lead{} = lead) do
    Repo.delete(lead)
  end

  def change_lead(%Lead{} = lead) do
    Lead.changeset(lead, %{})
  end
end
