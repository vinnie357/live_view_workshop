defmodule LiveViewWorkshopWeb.WorkshopGoalsLive do
  use LiveViewWorkshopWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket |> assign(:slide, __MODULE__) |> ok()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>What's the Workshop For</h1>

    <h2>This is not a Phoenix LiveView sales pitch</h2>

    <p>This is about to:</p>

    <ul>
      <li>highlight diff to regular web development</li>
      <li>explore LiveView possibilities</li>
      <li>shows different approaches</li>
      <li>discuss pros and cons</li>
    </ul>
    """
  end
end
