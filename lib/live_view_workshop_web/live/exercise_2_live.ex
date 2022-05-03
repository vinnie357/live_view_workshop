defmodule LiveViewWorkshopWeb.Components.TabGroup2 do
  use LiveViewWorkshopWeb, :component

  def tab_group(assigns) do
    ~H"""
    """
  end
end

defmodule LiveViewWorkshopWeb.Exercise2Live do
  use LiveViewWorkshopWeb, :live_view
  import LiveViewWorkshopWeb.Components.TabGroup2

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
    <h1>Exercise 2: Extract tabs to a Component</h1>
    <h3><%= @path %></h3>

    <.tab_group />

    <div class="tab-group">
      <div class="tab-labels">
        <a href="#" phx-click="select_tab" phx-value-tab="tab_1" class={classes([@active_tab == "tab_1" && "tab-active"])}>
          Tab 1
        </a>
        <a href="#" phx-click="select_tab" phx-value-tab="tab_2" class={classes([@active_tab == "tab_2" && "tab-active"])}>
          Tab 2
        </a>
        <a href="#" phx-click="select_tab" phx-value-tab="tab_3" class={classes([@active_tab == "tab_3" && "tab-active"])}>
          Tab 3
        </a>
      </div>

      <div class="tab-contents">
        <div class={classes([@active_tab == "tab_1" && "tab-active"])}>
          At this time take a look into the
          <a href="https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html">
            Component docs
          </a>
          to understand how to extract some HEEx code into their own functional components.
          Also, consider to use some slots here.
        </div>
        <div class={classes([@active_tab == "tab_2" && "tab-active"])}>
          There you go!
        </div>
        <div class={classes([@active_tab == "tab_3" && "tab-active"])}>
          Woohoo!
        </div>
      </div>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def handle_event("select_tab", %{"tab" => tab}, socket) do
    socket
    |> assign(:active_tab, tab)
    |> noreply()
  end

  defp classes(list), do: list |> Enum.filter(& &1) |> Enum.join(" ")
end
