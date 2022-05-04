defmodule LiveViewWorkshopWeb.LiveviewCallbacksLive do
  use LiveViewWorkshopWeb, :live_view
  alias LiveViewWorkshop.Tracker

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket
    |> track_and_assign(:mount)
    |> ok()
  end

  @impl Phoenix.LiveView
  def handle_params(_params, _uri, socket) do
    socket
    |> track_and_assign(:handle_params)
    |> noreply()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    assigns =
      case assigns.messages do
        [] -> assigns
        _ -> Map.put(assigns, :messages, track_message(assigns.socket, :render))
      end

    ~H"""
    <h1>Phoenix LiveView Callbacks</h1>
    <div>
      <div>
        <button class="button outline" phx-click="clear">Clear</button>
        <%= link "Link", to: Routes.liveview_callbacks_path(@socket, :index), class: "button" %>
        <%= live_redirect "Redirect", to: Routes.liveview_callbacks_path(@socket, :index), class: "button" %>
        <%= live_patch "Patch", to: Routes.liveview_callbacks_path(@socket, :index, foo: :bar), class: "button" %>
        <button class="button" phx-click="some-event">Event</button>
      </div>
      <ol>
        <%= for message <- @messages do %>
          <li><%= message %></li>
        <% end %>
      </ol>
    </div>
    """
  end

  @impl true
  def handle_event("clear", _params, socket) do
    Tracker.clear()
    socket |> assign(:messages, []) |> noreply()
  end

  def handle_event("some-event", _params, socket) do
    socket
    |> track_and_assign(:handle_event)
    |> noreply()
  end

  defp track_message(socket, message) do
    protocol = if connected?(socket), do: "ws", else: "http"
    Tracker.add("#{protocol} => #{message}")
  end

  defp track_and_assign(socket, message) do
    assign(socket, :messages, track_message(socket, message))
  end
end
