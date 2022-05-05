defmodule LiveViewWorkshopWeb.Exercise1Live do
  use LiveViewWorkshopWeb, :live_view

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
    <h1>Exercise 1: Let's implement Tabs!</h1>
    <h3><%= @path %></h3>

    <p>We already have styling setup, so keep using the same css classes.</p>
    <p>Now we need to hook up some click events to activate another tab and show their content properly.</p>

    <div class="tab-group">
      <div class="tab-labels">
        <a href="#" class="tab-active">Tab 1</a>
        <a href="#">Tab 2</a>
        <a href="#">Tab 3</a>
      </div>

      <div class="tab-contents">
        <div class="tab-active">
          If you don't know where to start check the very first example
          <a href="https://hexdocs.pm/phoenix_live_view/bindings.html">
            in the Binding docs
          </a>
        </div>
        <div>There you go!</div>
        <div>Woohoo!</div>
      </div>
    </div>
    """
  end
end
