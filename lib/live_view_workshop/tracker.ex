defmodule LiveViewWorkshop.Tracker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl GenServer
  def init(state) do
    {:ok, state}
  end

  def add(message) do
    GenServer.call(__MODULE__, {:add, message})
  end

  def clear() do
    GenServer.cast(__MODULE__, :clear)
  end

  @impl GenServer
  def handle_call({:add, message}, _from, state) do
    state = state ++ [message]
    {:reply, state, state}
  end

  @impl GenServer
  def handle_cast(:clear, _state) do
    {:noreply, []}
  end
end
