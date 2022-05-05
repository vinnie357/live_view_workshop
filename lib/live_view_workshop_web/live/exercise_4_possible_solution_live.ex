defmodule LiveViewWorkshopWeb.Components.TabGroupPossibleSolution4 do
  use LiveViewWorkshopWeb, :component

  def tab_group(assigns) do
    [%{id: first_tab_id} | _] = assigns.tab
    assigns = Map.put(assigns, :active_tab, assigns.active_tab || first_tab_id)

    ~H"""
    <div class="tab-group">
      <div class="tab-labels">
        <%= for tab <- @tab do %>
          <%= live_patch tab.label, to: tab.path, class: classes([@active_tab == tab.id && "tab-active"]) %>
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

defmodule LiveViewWorkshopWeb.Exercise4PossibleSolutionLive do
  use LiveViewWorkshopWeb, :live_view
  import LiveViewWorkshopWeb.Components.TabGroupPossibleSolution4

  @path __ENV__.file |> String.replace_prefix(File.cwd!(), "") |> String.trim("/")
  @code File.read!(__ENV__.file)

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket
    |> assign(:path, @path)
    |> assign(:code, @code)
    |> assign(:path_tab_1, Routes.exercise4_possible_solution_path(socket, :index))
    |> assign(:path_tab_2, Routes.exercise4_possible_solution_path(socket, :index, "tab_2"))
    |> assign(:path_tab_3, Routes.exercise4_possible_solution_path(socket, :index, "tab_3"))
    |> ok()
  end

  @impl Phoenix.LiveView
  def handle_params(params, _uri, socket) do
    socket
    |> assign(:tab, params["tab"])
    |> noreply()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Exercise 4: Possible Solution</h1>
    <h3><%= @path %></h3>

    <.tab_group active_tab={@tab}>
      <:tab id="tab_1" label="Tab 1" path={@path_tab_1}>Content 1</:tab>
      <:tab id="tab_2" label="Tab 2" path={@path_tab_2}>Content 2</:tab>
      <:tab id="tab_3" label="Tab 3" path={@path_tab_3}>Content 3</:tab>
    </.tab_group>
    <.code type="elixir"><%= @code %></.code>
    """
  end
end
