defmodule CrmWeb.OpportunityController do
  use CrmWeb, :controller

  alias Crm.Sales
  alias Crm.Sales.Opportunity

  def index(conn, _params) do
    opportunities = Sales.list_opportunities()
    render(conn, "index.html", opportunities: opportunities)
  end

  def new(conn, _params) do
    changeset = Sales.change_opportunity(%Opportunity{})
    accounts = Sales.list_repo_accounts()
    render(conn, "new.html", changeset: changeset, accounts: accounts)
  end

  def create(conn, %{"opportunity" => opportunity_params}) do
    id = Map.get(opportunity_params, "account_id")
    account = Sales.get_account!(id)

    case Sales.create_opportunity(account, opportunity_params) do
      {:ok, opportunity} ->
        conn
        |> put_flash(:info, "Opportunity created successfully.")
        |> redirect(to: Routes.opportunity_path(conn, :show, opportunity))

      {:error, %Ecto.Changeset{} = changeset} ->
        accounts = Sales.list_repo_accounts()
        render(conn, "new.html", changeset: changeset, accounts: accounts)
    end
  end

  def show(conn, %{"id" => id}) do
    opportunity = Sales.get_opportunity!(id)
    changeset = Sales.build_opportunity_note(opportunity)
    render(conn, "show.html", opportunity: opportunity, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    opportunity = Sales.get_opportunity!(id)
    changeset = Sales.change_opportunity(opportunity)
    render(conn, "edit.html", opportunity: opportunity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "opportunity" => opportunity_params}) do
    opportunity = Sales.get_opportunity!(id)

    case Sales.update_opportunity(opportunity, opportunity_params) do
      {:ok, opportunity} ->
        conn
        |> put_flash(:info, "Opportunity updated successfully.")
        |> redirect(to: Routes.opportunity_path(conn, :show, opportunity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", opportunity: opportunity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    opportunity = Sales.get_opportunity!(id)
    {:ok, _opportunity} = Sales.delete_opportunity(opportunity)

    conn
    |> put_flash(:info, "Opportunity deleted successfully.")
    |> redirect(to: Routes.opportunity_path(conn, :index))
  end

  def addnote(conn, %{"id" => id, "note" => note_params}) do
    opportunity = Sales.get_opportunity!(id)
    case Sales.create_opportunity_note(opportunity, note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note created successfully.")
        |> redirect(to: Routes.opportunity_path(conn, :show, opportunity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "show.html", changeset: changeset, opportunity: opportunity)
    end
  end
end
