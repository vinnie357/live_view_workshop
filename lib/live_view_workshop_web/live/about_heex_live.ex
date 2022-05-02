defmodule LiveViewWorkshopWeb.AboutHeexLive do
  use LiveViewWorkshopWeb, :live_view

  @heex_example ~S"""
  def render(%{} = assigns) do
    assigns = Map.put_new(assigns, :name, "there")

    ~H\"""
    <div>
      <h1>Hi <%= @name %>!</h1>

      <%= for language <- (assigns[:languages] || []) do %>
        <%= if language == "en" do %>
          <.greeting {@greeting_attrs}>
            <:header primary hidden={false}>
              What's up!
            </:header>
          </.greeting>
        <% else %>
          <Translator.greeting language={@language} />
        <% end %>
      <% end %>
    </div>
    \"""
  end
  """

  @impl Phoenix.LiveView
  def render(assigns) do
    assigns = assigns |> Map.put(:heex_example, @heex_example)

    ~H"""
    <h1>HEEx</h1>

    <h3>EEx => LEEx => HEEx</h3>

    <p>Syntax Madness 😱</p>

    <.code type="erb"><%= @heex_example %></.code>
    """
  end
end
