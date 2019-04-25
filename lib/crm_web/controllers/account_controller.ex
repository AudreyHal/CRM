defmodule CrmWeb.AccountController do
  use CrmWeb, :controller

  alias Crm.Sales
  alias Crm.Sales.Account

  def index(conn, _params) do
    accounts = Sales.list_accounts()
    render(conn, "index.html", accounts: accounts)
  end

  @spec new(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Sales.change_account(%Account{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"account" => account_params}) do
    case Sales.create_account(account_params) do
      {:ok, account} ->
        conn
        |> put_flash(:info, "Account created successfully.")
        |> redirect(to: Routes.account_path(conn, :show, account))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    account = Sales.get_account!(id)
    changeset = Sales.build_account_note(account)
    render(conn, "show.html", account: account, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    account = Sales.get_account!(id)
    changeset = Sales.change_account(account)
    render(conn, "edit.html", account: account, changeset: changeset)
  end

  def update(conn, %{"id" => id, "account" => account_params}) do
    account = Sales.get_account!(id)

    case Sales.update_account(account, account_params) do
      {:ok, account} ->
        conn
        |> put_flash(:info, "Account updated successfully.")
        |> redirect(to: Routes.account_path(conn, :show, account))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", account: account, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    account = Sales.get_account!(id)
    {:ok, _account} = Sales.delete_account(account)

    conn
    |> put_flash(:info, "Account deleted successfully.")
    |> redirect(to: Routes.account_path(conn, :index))
  end

  def addnote(conn, %{"id" => id, "note" => note_params}) do
    #id = Map.get(note_params, "account_id")
    account= Sales.get_account!(id)
    case Sales.create_account_note(account, note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note created successfully.")
        |> redirect(to: Routes.account_path(conn, :show, account))

      {:error, %Ecto.Changeset{} = changeset} ->


        render(conn, "show.html", changeset: changeset, account: account)
    end
  end
end
