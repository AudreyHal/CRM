defmodule Crm.Sales.Account do
  use Ecto.Schema
  import Ecto.Changeset
  alias Crm.Sales.Note

  alias Crm.Sales.Opportunity

  schema "accounts" do
    field :address, :string
    field :assignee, :string
    field :category, :string
    field :city, :string
    field :country, :string
    field :email, :string
    field :name, :string
    field :phone, :string
    field :rating, :integer
    field :tags, :string
    field :website, :string
    field :zipcode, :integer
    has_many :opportunities, Opportunity
    has_many :notes, Note

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:name, :phone, :email, :assignee, :category, :rating, :tags, :address, :city, :country, :zipcode, :website])
    |> validate_required([:name, :phone, :email, :assignee, :category, :rating, :tags, :address, :city, :country, :zipcode, :website])
  end
end
