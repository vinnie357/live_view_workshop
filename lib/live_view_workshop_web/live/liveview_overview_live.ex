defmodule LiveViewWorkshopWeb.LiveviewOverviewLive do
  use LiveViewWorkshopWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket |> assign(:slide, __MODULE__) |> ok()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>What's Phoenix LiveView</h1>

    <h3>Elixir/Phoenix library created to provide a rich and real-time experience with server-rendered HTML</h3>

    <ul>
      <li>user keeps a live conn trough websocket (GenServer)</li>
      <li>GenServer holds the user state</li>
      <li>GenServer renders the HTML</li>
      <li>GenServer compares last generated HTML</li>
      <li>Sends only the diff through the websocket</li>
    </ul>
    """
  end
end
