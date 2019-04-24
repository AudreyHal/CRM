defmodule CrmWeb.OpportunityControllerTest do
  use CrmWeb.ConnCase

  alias Crm.Sales

  @create_attrs %{amount: "120.5", assigned_to: "some assigned_to", close_date: ~D[2010-04-17], discount: "some discount", name: "some name", probability: "some probability", stage: "some stage"}
  @update_attrs %{amount: "456.7", assigned_to: "some updated assigned_to", close_date: ~D[2011-05-18], discount: "some updated discount", name: "some updated name", probability: "some updated probability", stage: "some updated stage"}
  @invalid_attrs %{amount: nil, assigned_to: nil, close_date: nil, discount: nil, name: nil, probability: nil, stage: nil}

  def fixture(:opportunity) do
    {:ok, opportunity} = Sales.create_opportunity(@create_attrs)
    opportunity
  end

  describe "index" do
    test "lists all opportunities", %{conn: conn} do
      conn = get(conn, Routes.opportunity_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Opportunities"
    end
  end

  describe "new opportunity" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.opportunity_path(conn, :new))
      assert html_response(conn, 200) =~ "New Opportunity"
    end
  end

  describe "create opportunity" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.opportunity_path(conn, :create), opportunity: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.opportunity_path(conn, :show, id)

      conn = get(conn, Routes.opportunity_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Opportunity"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.opportunity_path(conn, :create), opportunity: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Opportunity"
    end
  end

  describe "edit opportunity" do
    setup [:create_opportunity]

    test "renders form for editing chosen opportunity", %{conn: conn, opportunity: opportunity} do
      conn = get(conn, Routes.opportunity_path(conn, :edit, opportunity))
      assert html_response(conn, 200) =~ "Edit Opportunity"
    end
  end

  describe "update opportunity" do
    setup [:create_opportunity]

    test "redirects when data is valid", %{conn: conn, opportunity: opportunity} do
      conn = put(conn, Routes.opportunity_path(conn, :update, opportunity), opportunity: @update_attrs)
      assert redirected_to(conn) == Routes.opportunity_path(conn, :show, opportunity)

      conn = get(conn, Routes.opportunity_path(conn, :show, opportunity))
      assert html_response(conn, 200) =~ "some updated assigned_to"
    end

    test "renders errors when data is invalid", %{conn: conn, opportunity: opportunity} do
      conn = put(conn, Routes.opportunity_path(conn, :update, opportunity), opportunity: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Opportunity"
    end
  end

  describe "delete opportunity" do
    setup [:create_opportunity]

    test "deletes chosen opportunity", %{conn: conn, opportunity: opportunity} do
      conn = delete(conn, Routes.opportunity_path(conn, :delete, opportunity))
      assert redirected_to(conn) == Routes.opportunity_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.opportunity_path(conn, :show, opportunity))
      end
    end
  end

  defp create_opportunity(_) do
    opportunity = fixture(:opportunity)
    {:ok, opportunity: opportunity}
  end
end
