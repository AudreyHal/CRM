defmodule Crm.Sales do
  @moduledoc """
  The Sales context.
  """

  import Ecto.Query, warn: false
  alias Crm.Repo

  alias Crm.Sales.Account

  @doc """
  Returns the list of accounts.

  ## Examples

      iex> list_accounts()
      [%Account{}, ...]

  """
  def list_accounts do
    Repo.all(Account)
  end

  def list_repo_accounts do
    Repo.all(Account) |> Enum.map(&{&1.name, &1.id})
  end

  @doc """
  Gets a single account.

  Raises `Ecto.NoResultsError` if the Account does not exist.

  ## Examples

      iex> get_account!(123)
      %Account{}

      iex> get_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_account!(id), do: Repo.get!(Account, id)

  @doc """
  Creates a account.

  ## Examples

      iex> create_account(%{field: value})
      {:ok, %Account{}}

      iex> create_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a account.

  ## Examples

      iex> update_account(account, %{field: new_value})
      {:ok, %Account{}}

      iex> update_account(account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Account.

  ## Examples

      iex> delete_account(account)
      {:ok, %Account{}}

      iex> delete_account(account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account changes.

  ## Examples

      iex> change_account(account)
      %Ecto.Changeset{source: %Account{}}

  """
  def change_account(%Account{} = account) do
    Account.changeset(account, %{})
  end

  alias Crm.Sales.Opportunity

  @doc """
  Returns the list of opportunities.

  ## Examples

      iex> list_opportunities()
      [%Opportunity{}, ...]

  """
  def list_opportunities do
    Repo.all(Opportunity)
  end

  @doc """
  Gets a single opportunity.

  Raises `Ecto.NoResultsError` if the Opportunity does not exist.

  ## Examples

      iex> get_opportunity!(123)
      %Opportunity{}

      iex> get_opportunity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_opportunity!(id), do: Repo.get!(Opportunity, id)

  @doc """
  Creates a opportunity.

  ## Examples

      iex> create_opportunity(%{field: value})
      {:ok, %Opportunity{}}

      iex> create_opportunity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_opportunity(%Account{} = account, attrs \\ %{}) do
    account
    |> Ecto.build_assoc(:opportunities)
    |> Opportunity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a opportunity.

  ## Examples

      iex> update_opportunity(opportunity, %{field: new_value})
      {:ok, %Opportunity{}}

      iex> update_opportunity(opportunity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_opportunity(%Opportunity{} = opportunity, attrs) do
    opportunity
    |> Opportunity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Opportunity.

  ## Examples

      iex> delete_opportunity(opportunity)
      {:ok, %Opportunity{}}

      iex> delete_opportunity(opportunity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_opportunity(%Opportunity{} = opportunity) do
    Repo.delete(opportunity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking opportunity changes.

  ## Examples

      iex> change_opportunity(opportunity)
      %Ecto.Changeset{source: %Opportunity{}}

  """
  def change_opportunity(%Opportunity{} = opportunity) do
    Opportunity.changeset(opportunity, %{})
  end
end
