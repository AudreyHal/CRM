defmodule Crm.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :description, :string
      add :account_id, references(:accounts, on_delete: :delete_all)
      add :opportunity_id, references(:opportunities, on_delete: :delete_all)
      add :contact_id, references(:contacts, on_delete: :delete_all)
      add :lead_id, references(:leads, on_delete: :delete_all)

      timestamps()
    end

    create index(:notes, [:account_id])
    create index(:notes, [:opportunity_id])
    create index(:notes, [:contact_id])
    create index(:notes, [:lead_id])
  end
end
