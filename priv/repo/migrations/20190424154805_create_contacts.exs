defmodule Crm.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :city, :string
      add :country, :string
      add :department, :string
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :phone, :string
      add :street, :string
      add :title, :string
      add :account_id, references(:accounts)

      timestamps()
    end

  end
end
