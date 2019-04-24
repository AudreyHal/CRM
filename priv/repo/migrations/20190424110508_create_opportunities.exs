defmodule Crm.Repo.Migrations.CreateOpportunities do
  use Ecto.Migration

  def change do
    create table(:opportunities) do
      add :name, :string
      add :amount, :decimal
      add :assigned_to, :string
      add :close_date, :date
      add :discount, :string
      add :probability, :string
      add :stage, :string
      add :account_id, references(:accounts, on_delete: :nothing)

      timestamps()
    end

    create index(:opportunities, [:account_id])
  end
end
