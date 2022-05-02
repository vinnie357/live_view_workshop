defmodule LiveViewWorkshopWeb.WhatIsPhoenixLiveviewIsForLive do
  use LiveViewWorkshopWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>What's Phoenix LiveView is for</h1>

    <ul>
      <li>HTML rendering</li>
    </ul>
    """
  end
end
