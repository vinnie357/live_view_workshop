defmodule LiveViewWorkshopWeb.Components.Code do
  use LiveViewWorkshopWeb, :component

  def code(assigns) do
    ~H"""
    <pre id={"code-#{@type}"} phx-hook="Code"><code class={"language-#{@type}"}><%= render_slot(@inner_block) %></code></pre>
    """
  end
end
