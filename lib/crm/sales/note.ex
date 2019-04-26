defmodule Crm.Sales.Note do
  use Ecto.Schema
  import Ecto.Changeset

  alias Crm.Sales.{Account, Opportunity, Lead, Contact}

  schema "notes" do
    field :description, :string
    belongs_to  :account, Account
    belongs_to :opportunity, Opportunity
    belongs_to  :contact, Contact
    belongs_to :lead, Lead

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
