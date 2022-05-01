defmodule LiveViewWorkshopWeb.HomeLive do
  use LiveViewWorkshopWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Phoenix LiveView Workshop</h1>
    <h2>Welcome JaxEx!</h2>
    <%= live_redirect "Let's start!", to: Routes.workshop_goals_path(@socket, :index), class: "button" %>
    """
  end
end
