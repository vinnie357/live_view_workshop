defmodule LiveViewWorkshopWeb.Exercise5PossibleSolutionLive.State do
  defstruct [:active_tab]
  @types %{active_tab: :string}

  def changeset(schema \\ %__MODULE__{}, params) do
    {schema, @types}
    |> Ecto.Changeset.cast(params, [:active_tab])
    |> Ecto.Changeset.validate_required([:active_tab])
  end
end

defmodule LiveViewWorkshopWeb.Components.TabGroupPossibleSolution5 do
  use LiveViewWorkshopWeb, :live_component
  alias LiveViewWorkshopWeb.Exercise5PossibleSolutionLive.State

  def tab_group(assigns) do
    ~H"""
    <.live_component id="tab" module={__MODULE__} {assigns} />
    """
  end

  @impl Phoenix.LiveComponent
  def mount(socket) do
    changeset = State.changeset(%{})
    fields = changeset.data |> Map.from_struct() |> Map.keys()

    socket
    |> assign(:changeset, changeset)
    |> assign(:fields, fields)
    |> ok()
  end

  @impl Phoenix.LiveComponent
  def render(assigns) do
    ~H"""
    <div class="tab-group">
      <.form id="recovery-form" let={f} for={@changeset} phx-change="form_change" phx-target={@myself}>
        <%= for field <- @fields do %>
          <%= hidden_input f, field %>
        <% end %>
      </.form>
      <div class="tab-labels">
        <%= for tab <- @tab do %>
          <a href="#" class={classes([active_tab(assigns) == tab.id && "tab-active"])} phx-click="select_tab" phx-value-tab={tab.id} phx-target={@myself}>
            <%= tab.label %>
          </a>
        <% end %>
      </div>

      <div class="tab-contents">
        <%= for tab <- @tab do %>
          <div class={classes([active_tab(assigns) == tab.id && "tab-active"])}>
            <%= render_slot(tab) %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  @impl Phoenix.LiveComponent
  def handle_event("select_tab", %{"tab" => tab}, socket) do
    socket
    |> assign(changeset: State.changeset(%{active_tab: tab}))
    |> noreply()
  end

  def handle_event("form_change", %{"state" => params}, socket) do
    socket
    |> assign(:changeset, State.changeset(params))
    |> noreply()
  end

  defp active_tab(%{tab: tab, changeset: changeset}) do
    [%{id: first_tab_id} | _] = tab
    changeset.changes[:active_tab] || first_tab_id
  end

  defp classes(list), do: list |> Enum.filter(& &1) |> Enum.join(" ")
end

defmodule LiveViewWorkshopWeb.Exercise5PossibleSolutionLive do
  use LiveViewWorkshopWeb, :live_view
  import LiveViewWorkshopWeb.Components.TabGroupPossibleSolution5

  @path __ENV__.file |> String.replace_prefix(File.cwd!(), "") |> String.trim("/")
  @code File.read!(__ENV__.file)

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket
    |> assign(:path, @path)
    |> assign(:code, @code)
    |> ok()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Exercise 5: Possible Solution</h1>
    <h3><%= @path %></h3>
    <.tab_group>
      <:tab id="tab_1" label="Tab 1">Content 1</:tab>
      <:tab id="tab_2" label="Tab 2">Content 2</:tab>
      <:tab id="tab_3" label="Tab 3">Content 3</:tab>
    </.tab_group>
    <.code type="elixir"><%= @code %></.code>
    """
  end
end
