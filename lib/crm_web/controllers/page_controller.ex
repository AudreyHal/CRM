defmodule CrmWeb.PageController do
  use CrmWeb, :controller

  def index(conn, _params) do
 conn
 |> redirect(to: Routes.account_path(conn, :index))
  end
end
