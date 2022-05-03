defmodule LiveViewWorkshopWeb.Components.TabGroup3 do
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

defmodule LiveViewWorkshopWeb.Exercise3Live do
  use LiveViewWorkshopWeb, :live_view
  import LiveViewWorkshopWeb.Components.TabGroup3

  @path __ENV__.file |> String.replace_prefix(File.cwd!(), "") |> String.trim("/")

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket
    |> assign(:active_tab, "tab_1")
    |> assign(:path, @path)
    |> ok()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Exercise 3: Make TabGroup component to hold state</h1>
    <h3><%= @path %></h3>

    <.tab_group active_tab={@active_tab}>
      <:tab id="tab_1" label="Tab 1">
        In order to hold state a Component needs to be a
        <a href="https://hexdocs.pm/phoenix_live_view/Phoenix.LiveComponent.html">
          LiveComponent
        </a>
      </:tab>
      <:tab id="tab_2" label="Tab 2">
        There you go!
      </:tab>
      <:tab id="tab_3" label="Tab 3">
        Woohoo!
      </:tab>
    </.tab_group>
    """
  end

  @impl Phoenix.LiveView
  def handle_event("select_tab", %{"tab" => tab}, socket) do
    socket
    |> assign(:active_tab, tab)
    |> noreply()
  end
end
