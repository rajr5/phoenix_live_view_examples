defmodule LiveviewExamplesWeb.ClickerComponent do
  use Phoenix.LiveComponent

  # alias LiveviewExamples.Users

  def render(assigns) do
    ~L"""
    <div id="clicker-<%= @id %>" class="clicker">
      <input type="text" value="<%= @click_count %>" readonly="true" />
      <button phx-click="increment-clicker" phx-target="#clicker-<%= @id %>">+</button>
    </div>
    """
  end

  def mount(%{id: id}, _session, socket) do
    socket = assign(socket,
      click_count: 0,
      id: id
    )
    {:ok, socket}
  end

  def update(%{id: id}, socket) do
    # IO.inspect("updated called for #{id}")

    click_count = Map.get(socket.assigns, :click_count, 0)
    socket =
      socket
      |> assign(id: id)
      |> assign(click_count: click_count)

    {:ok, socket}
  end

  def handle_event("increment-clicker", _, socket) do
    new_click_count = socket.assigns.click_count + 1
    {:noreply, assign(socket, click_count: new_click_count)}
  end
end
