defmodule LiveViewWorkshopWeb.Exercise1PossibleSolutionLive do
  use LiveViewWorkshopWeb, :live_view

  @path __ENV__.file |> String.replace_prefix(File.cwd!(), "") |> String.trim("/")
  @code File.read!(__ENV__.file)

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket
    |> assign(:active_tab, "tab_1")
    |> assign(:path, @path)
    |> assign(:code, @code)
    |> ok()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Exercise 1: Possible Solution</h1>
    <h3><%= @path %></h3>

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
          Content 1
        </div>
        <div class={classes([@active_tab == "tab_2" && "tab-active"])}>
          Content 2
        </div>
        <div class={classes([@active_tab == "tab_3" && "tab-active"])}>
          Content 3
        </div>
      </div>
    </div>
    <.code type="elixir"><%= @code %></.code>
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
