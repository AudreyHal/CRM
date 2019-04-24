defmodule Crm.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :phone, :string
      add :email, :string
      add :assignee, :string
      add :category, :string
      add :rating, :integer
      add :tags, :string
      add :address, :string
      add :city, :string
      add :country, :string
      add :zipcode, :integer
      add :website, :string

      timestamps()
    end

  end
end
