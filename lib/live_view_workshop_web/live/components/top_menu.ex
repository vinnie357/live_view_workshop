defmodule LiveViewWorkshopWeb.Components.TopMenu do
  use LiveViewWorkshopWeb, :component
  alias LiveViewWorkshopWeb.WorkshopGoalsLive
  alias LiveViewWorkshopWeb.LiveviewOverviewLive
  alias LiveViewWorkshopWeb.WhatIsPhoenixLiveviewIsNotForLive
  alias LiveViewWorkshopWeb.WhatIsPhoenixLiveviewIsForLive
  alias LiveViewWorkshopWeb.TheSimplestLiveviewLive
  alias LiveViewWorkshopWeb.AboutHeexLive
  alias LiveViewWorkshopWeb.LiveviewCallbacksLive
  alias LiveViewWorkshopWeb.Exercise1Live
  alias LiveViewWorkshopWeb.Exercise1PossibleSolutionLive
  alias LiveViewWorkshopWeb.Exercise1PossibleSolutionSmallerLive
  alias LiveViewWorkshopWeb.Exercise2Live
  alias LiveViewWorkshopWeb.Exercise2PossibleSolutionLive
  alias LiveViewWorkshopWeb.Exercise3Live
  alias LiveViewWorkshopWeb.Exercise3PossibleSolutionLive
  alias LiveViewWorkshopWeb.TheDeployProblemLive
  alias LiveViewWorkshopWeb.Exercise4Live
  alias LiveViewWorkshopWeb.Exercise4PossibleSolutionLive
  alias LiveViewWorkshopWeb.Exercise5Live
  alias LiveViewWorkshopWeb.Exercise5PossibleSolutionLive
  alias LiveViewWorkshopWeb.PlansForNextLive

  @slides [
    {WorkshopGoalsLive, &Routes.workshop_goals_path/2},
    {LiveviewOverviewLive, &Routes.liveview_overview_path/2},
    {WhatIsPhoenixLiveviewIsNotForLive, &Routes.what_is_phoenix_liveview_is_not_for_path/2},
    {WhatIsPhoenixLiveviewIsForLive, &Routes.what_is_phoenix_liveview_is_for_path/2},
    {TheSimplestLiveviewLive, &Routes.the_simplest_liveview_path/2},
    {AboutHeexLive, &Routes.about_heex_path/2},
    {LiveviewCallbacksLive, &Routes.liveview_callbacks_path/2},
    {Exercise1Live, &Routes.exercise1_path/2},
    {Exercise1PossibleSolutionLive, &Routes.exercise1_possible_solution_path/2},
    {Exercise1PossibleSolutionSmallerLive, &Routes.exercise1_possible_solution_smaller_path/2},
    {Exercise2Live, &Routes.exercise2_path/2},
    {Exercise2PossibleSolutionLive, &Routes.exercise2_possible_solution_path/2},
    {Exercise3Live, &Routes.exercise3_path/2},
    {Exercise3PossibleSolutionLive, &Routes.exercise3_possible_solution_path/2},
    {TheDeployProblemLive, &Routes.the_deploy_problem_path/2},
    {Exercise4Live, &Routes.exercise4_path/2},
    {Exercise4PossibleSolutionLive, &Routes.exercise4_possible_solution_path/2},
    {Exercise5Live, &Routes.exercise5_path/2},
    {Exercise5PossibleSolutionLive, &Routes.exercise5_possible_solution_path/2},
    {PlansForNextLive, &Routes.plans_for_next_path/2}
  ]

  @slides_count Enum.count(@slides)

  def slider_actions(assigns) do
    assigns =
      assigns
      |> Map.put(:current_index, current_index(assigns.socket.view))
      |> Map.put(:slides_count, @slides_count)

    ~H"""
    <%= if @current_index do %>
      <.nav_button text="<" path_func={path_func(@current_index - 1)} socket={@socket} />
      <%= @current_index + 1 %> / <%= @slides_count %>
      <.nav_button text=">" path_func={path_func(@current_index + 1)} socket={@socket} />
    <% end %>
    """
  end

  defp nav_button(assigns) do
    ~H"""
    <%= if @path_func do %>
      <%= live_redirect @text, to: @path_func.(@socket, :index), class: "button outline" %>
    <% else %>
      <button class="button outline" disabled><%= @text %></button>
    <% end %>
    """
  end

  defp current_index(view) do
    Enum.find_index(@slides, fn {module, _func_path} ->
      module == view
    end)
  end

  defp path_func(index) when index >= 0 do
    case Enum.at(@slides, index) do
      {_module, path_func} -> path_func
      _ -> nil
    end
  end

  defp path_func(_index), do: nil
end
