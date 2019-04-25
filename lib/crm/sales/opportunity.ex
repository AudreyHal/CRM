defmodule Crm.Sales.Opportunity do
  use Ecto.Schema
  import Ecto.Changeset
  alias Crm.Sales.Note


  schema "opportunities" do
    field :amount, :decimal
    field :assigned_to, :string
    field :close_date, :date
    field :discount, :string
    field :name, :string
    field :probability, :string
    field :stage, :string
    belongs_to :account, Account
    has_many :notes, Note

    timestamps()
  end

  @doc false
  def changeset(opportunity, attrs) do
    opportunity
    |> cast(attrs, [:name, :amount, :assigned_to, :close_date, :discount, :probability, :stage, :account_id])
    |> validate_required([:name, :amount, :assigned_to, :close_date, :discount, :probability, :stage, :account_id])
  end
end
