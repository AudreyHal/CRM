defmodule CrmWeb.PageControllerTest do
  use CrmWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
   
  end
end
