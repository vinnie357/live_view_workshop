defmodule LiveViewWorkshopWeb.HomeLive do
  use LiveViewWorkshopWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Welcome JaxEx!</h1>
    """
  end
end
