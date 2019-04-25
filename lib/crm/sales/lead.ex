defmodule Crm.Sales.Lead do
  use Ecto.Schema
  import Ecto.Changeset
  alias Crm.Sales.Note

  schema "leads" do
    field :city, :string
    field :company, :string
    field :country, :string
    field :department, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :status, :string
    field :street, :string
    field :title, :string
    has_many :notes, Note

    timestamps()
  end

  @doc false
  def changeset(lead, attrs) do
    lead
    |> cast(attrs, [:city, :company, :country, :department, :email, :first_name, :last_name, :phone, :status, :street, :title])
    |> validate_required([:city, :company, :country, :department, :email, :first_name, :last_name, :phone, :status, :street, :title])
  end
end
