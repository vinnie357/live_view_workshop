defmodule LiveViewWorkshopWeb.PlansForNextLive do
  use LiveViewWorkshopWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Plans for Next</h1>

    <ul>
      <li>
        Keep data Fresh
        <ul>
          <li>Polling</li>
          <li>PubSub</li>
        </ul>
      </li>
      <li>
        Forms
        <ul>
          <li>server side only validations</li>
          <li>debounce and throttle</li>
          <li>recover from failures and deploys</li>
          <li>multi-step form (wizard)</li>
        </ul>
      </li>
      <li>JS Hooks</li>
      <li>DOM patching & temporary assigns</li>
    </ul>
    """
  end
end
