defmodule CrmWeb.ContactController do
  use CrmWeb, :controller

  alias Crm.Sales
  alias Crm.Sales.{Contact, Note}

  def index(conn, _params) do
    contacts = Sales.list_contacts()
    render(conn, "index.html", contacts: contacts)
  end

  def new(conn, _params) do
    changeset = Sales.change_contact(%Contact{})
    accounts = Sales.list_repo_accounts()
    countries = Sales.get_countries()
    title = ["Mr", "Mrs", "Miss", "Dr.", "Prof."]
    render(conn, "new.html", changeset: changeset, accounts: accounts, countries: countries, title: title)
  end

  def create(conn, %{"contact" => contact_params}) do
    id = Map.get(contact_params, "account_id")
    account = Sales.get_account!(id)
    case Sales.create_contact(account, contact_params) do
      {:ok, contact} ->
        conn
        |> put_flash(:info, "Contact created successfully.")
        |> redirect(to: Routes.contact_path(conn, :show, contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        accounts = Sales.list_repo_accounts()
        countries = Sales.get_countries()
        title = ["Mr", "Mrs", "Miss", "Dr.", "Prof."]
        render(conn, "new.html", changeset: changeset, accounts: accounts, countries: countries, title: title)
    end
  end

  def show(conn, %{"id" => id}) do
    contact = Sales.get_contact!(id)
    render(conn, "show.html", contact: contact)
  end

  def edit(conn, %{"id" => id}) do
    contact = Sales.get_contact!(id)
    changeset = Sales.change_contact(contact)
    render(conn, "edit.html", contact: contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "contact" => contact_params}) do
    contact = Sales.get_contact!(id)

    case Sales.update_contact(contact, contact_params) do
      {:ok, contact} ->
        conn
        |> put_flash(:info, "Contact updated successfully.")
        |> redirect(to: Routes.contact_path(conn, :show, contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", contact: contact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    contact = Sales.get_contact!(id)
    {:ok, _contact} = Sales.delete_contact(contact)

    conn
    |> put_flash(:info, "Contact deleted successfully.")
    |> redirect(to: Routes.contact_path(conn, :index))
  end

  def addnote(conn, %{"id" => id, "note" => note_params}) do
    #id = Map.get(note_params, "account_id")
    contact= Sales.get_contact!(id)
    case Sales.create_contact_note(contact, note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note created successfully.")
        |> redirect(to: Routes.contact_path(conn, :show, contact))

      {:error, %Ecto.Changeset{} = changeset} ->


        render(conn, "show.html", changeset: changeset, contact: contact)
    end
end
end
