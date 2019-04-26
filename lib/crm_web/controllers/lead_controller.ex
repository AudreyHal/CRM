defmodule CrmWeb.LeadController do
  use CrmWeb, :controller

  alias Crm.Sales
  alias Crm.Sales.Lead

  def index(conn, _param) do
    leads = Sales.list_leads
    render(conn, :index, leads: leads)
  end

  def new(conn, _param) do
    statuses = Sales.get_statuses
    countries = Sales.get_countries
    title = Sales.get_title
    changeset = Sales.change_lead(%Lead{})
    render(conn, :new, changeset: changeset, statuses: statuses, countries: countries, title: title)
  end

  def create(conn, %{"lead" => lead_params}) do
    case Sales.create_lead(lead_params) do
      {:ok, lead} ->
        conn
        |> put_flash(:info, "Lead created successfully.")
        |> redirect(to: Routes.lead_path(conn, :show, lead))

      {:error, %Ecto.Changeset{} = changeset} ->
        statuses = Sales.get_statuses
        countries = Sales.get_countries
        title = Sales.get_title
        render(conn, :new, changeset: changeset, statuses: statuses, countries: countries, title: title)
    end
  end

  def show(conn, %{"id" => id}) do
    lead = Sales.get_lead!(id)
    changeset = Sales.change_lead(lead)
    render(conn, :show, lead: lead, changeset: changeset)
  end

  def addnote(conn, %{"id" => id, "note" => note_params}) do
    #id = Map.get(note_params, "account_id")
    lead = CRM.get_lead!(id)
    case CRM.create_lead_note(lead, note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note created successfully.")
        |> redirect(to: Routes.lead_path(conn, :show, lead))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "show.html", changeset: changeset, lead: lead)
    end
  end
end
