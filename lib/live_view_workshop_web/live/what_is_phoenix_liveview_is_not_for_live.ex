defmodule LiveViewWorkshopWeb.WhatIsPhoenixLiveviewIsNotForLive do
  use LiveViewWorkshopWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket |> assign(:slide, __MODULE__) |> ok()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>What's Phoenix LiveView is not for</h1>

    <ul>
      <li>Serving APIs</li>
      <li>JS frameworks</li>
    </ul>
    """
  end
end
