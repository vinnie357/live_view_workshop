defmodule LiveViewWorkshopWeb.TheSimplestLiveviewLive do
  use LiveViewWorkshopWeb, :live_view

  @live_view_code ~S"""
  # lib/phoenix_lv_workshop_web/live/example_live.ex
  defmodule LiveViewWorkshopWeb.TheSimplestLiveviewLive do
    use LiveViewWorkshopWeb, :live_view

    def render(assigns) do
      ~H"<h1>The Simplest LiveView ever!</h1>"
    end
  end
  """

  @router_code ~S"""
  # lib/phoenix_lv_workshop_web/router.ex
  live "/example", TheSimplestLiveviewLive, :index
  """

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket |> assign(:slide, __MODULE__) |> ok()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    assigns =
      assigns
      |> Map.put(:live_view_code, @live_view_code)
      |> Map.put(:router_code, @router_code)

    ~H"""
    <h1>The Simplest LiveView ever!</h1>

    <.code type="elixir"><%= @live_view_code %></.code>
    <.code type="elixir"><%= @router_code %></.code>
    """
  end
end
