defmodule CrmWeb.LeadController do
  use CrmWeb, :controller

  alias Crm.Sales
  alias Crm.Sales.Lead

  def index(conn, _param) do
    leads = Sales.list_leads
    render(conn, :index, leads: leads)
  end
end
