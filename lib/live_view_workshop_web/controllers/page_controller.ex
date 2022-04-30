defmodule LiveViewWorkshopWeb.PageController do
  use LiveViewWorkshopWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
