defmodule Crm.Repo.Migrations.CreateLeads do
  use Ecto.Migration

  def change do
    create table(:leads) do
      add :city, :string
      add :company, :string
      add :country, :string
      add :department, :string
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :phone, :string
      add :status, :string
      add :street, :string
      add :title, :string

      timestamps()
    end

  end
end
