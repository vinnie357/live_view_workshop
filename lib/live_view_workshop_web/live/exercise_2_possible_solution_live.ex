defmodule LiveViewWorkshopWeb.Components.TabGroupPossibleSolution do
  use LiveViewWorkshopWeb, :component

  def tab_group(assigns) do
    ~H"""
    <div class="tab-group">
      <div class="tab-labels">
        <%= for tab <- @tab do %>
          <a href="#" class={classes([@active_tab == tab.id && "tab-active"])} phx-click="select_tab" phx-value-tab={tab.id}>
            <%= tab.label %>
          </a>
        <% end %>
      </div>

      <div class="tab-contents">
        <%= for tab <- @tab do %>
          <div class={classes([@active_tab == tab.id && "tab-active"])}>
            <%= render_slot(tab) %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  defp classes(list), do: list |> Enum.filter(& &1) |> Enum.join(" ")
end

defmodule LiveViewWorkshopWeb.Exercise2PossibleSolutionLive do
  use LiveViewWorkshopWeb, :live_view
  import LiveViewWorkshopWeb.Components.TabGroupPossibleSolution

  @code File.read!(__ENV__.file)

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket
    |> assign(:active_tab, "tab_1")
    |> assign(:code, @code)
    |> ok()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Exercise 2: Possible Solution</h1>

    <.tab_group active_tab={@active_tab}>
      <:tab id="tab_1" label="Tab 1">
        At this time take a look into the
        <a href="https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html">
          Component docs
        </a>
        to understand how to extract some HEEx code into their own functional components.
        Also, consider to use some slots here.
      </:tab>
      <:tab id="tab_2" label="Tab 2">
        There you go!
      </:tab>
      <:tab id="tab_3" label="Tab 3">
        Woohoo!
      </:tab>
    </.tab_group>
    <.code type="elixir"><%= @code %></.code>
    """
  end

  @impl Phoenix.LiveView
  def handle_event("select_tab", %{"tab" => tab}, socket) do
    socket
    |> assign(:active_tab, tab)
    |> noreply()
  end
end
