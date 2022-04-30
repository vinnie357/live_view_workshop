defmodule LiveViewWorkshopWeb.HomeLiveTest do
  use LiveViewWorkshopWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  describe "Index" do
    test "sees home page", %{conn: conn} do
      {:ok, _live, html} = live(conn, Routes.home_path(conn, :index))

      assert html =~ "Welcome"
    end
  end
end
