defmodule LiveViewWorkshopWeb.TheDeployProblemLive do
  use LiveViewWorkshopWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>The Deploy problem!!!</h1>

    <p>If we refresh we loose the state!</p>
    <p>If we restart the app we loose the state!</p>
    """
  end
end
