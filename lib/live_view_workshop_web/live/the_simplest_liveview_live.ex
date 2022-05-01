defmodule LiveViewWorkshopWeb.TheSimplestLiveviewLive do
  use LiveViewWorkshopWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket |> assign(:slide, __MODULE__) |> ok()
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>The Simplest LiveView ever!</h1>

    ```elixir
    # lib/phoenix_lv_workshop_web/live/example_live.ex
    defmodule LiveViewWorkshopWeb.TheSimplestLiveviewLive do
      use LiveViewWorkshopWeb, :live_view

      def render(assigns) do
        ~H"<h1>The Simplest LiveView ever!</h1>"
      end
    end
    ```

    ```elixir
    # lib/phoenix_lv_workshop_web/router.ex
    live "/example", TheSimplestLiveviewLive, :index
    ```
    """
  end
end
