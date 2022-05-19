defmodule LiveViewWorkshopWeb.Components.TabGroup5 do
  use LiveViewWorkshopWeb, :live_component

  def tab_group(assigns) do
    ~H"""
    <.live_component id="tab" module={__MODULE__} {assigns} />
    """
  end

  @impl Phoenix.LiveComponent
  def render(assigns) do
    [%{id: first_tab_id} | _] = assigns.tab
    assigns = Map.put_new(assigns, :active_tab, first_tab_id)

    ~H"""
    <div class="tab-group">
      <div class="tab-labels">
        <%= for tab <- @tab do %>
          <a href="#" class={classes([@active_tab == tab.id && "tab-active"])} phx-click="select_tab" phx-value-tab={tab.id} phx-target={@myself}>
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

  @impl Phoenix.LiveComponent
  def handle_event("select_tab", %{"tab" => tab}, socket) do
    socket
    |> assign(:active_tab, tab)
    |> noreply()
  end

  defp classes(list), do: list |> Enum.filter(& &1) |> Enum.join(" ")
end

defmodule LiveViewWorkshopWeb.Exercise5Live do
  use LiveViewWorkshopWeb, :live_view
  import LiveViewWorkshopWeb.Components.TabGroup5

  @path __ENV__.file |> String.replace_prefix(File.cwd!(), "") |> String.trim("/")

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket
    |> assign(:path, @path)
    |> ok()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Exercise 5: Use a hidden form to recover from crashes</h1>
    <h3><%= @path %></h3>

    <.tab_group>
      <:tab id="tab_1" label="Tab 1">
        The way to start here is to have a <code>form</code> with <code>hidden inputs</code>.
        Check
        <a href="https://hexdocs.pm/phoenix_live_view/form-bindings.html#recovery-following-crashes-or-disconnects">
          this out!
        </a>.
        A side note here is that phoenix Live View demands an <code>id</code> for the form tag.
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
end
