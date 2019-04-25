defmodule Crm.Sales.Contact do
  use Ecto.Schema
  import Ecto.Changeset
  alias Crm.Sales.{Account}
  alias Crm.Sales.Note


  schema "contacts" do
    field :city, :string
    field :country, :string
    field :department, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :street, :string
    field :title, :string
    belongs_to :accounts, Account, foreign_key: :account_id
    has_many :notes, Note

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:city, :country, :department, :email, :first_name, :last_name, :phone, :street, :title])
    |> validate_required([:city, :country, :department, :email, :first_name, :last_name, :phone, :street, :title])
  end
end
