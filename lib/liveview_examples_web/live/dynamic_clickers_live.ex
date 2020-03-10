defmodule LiveviewExamplesWeb.DynamicClickersLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      <button phx-click="add-clicker">Add clicker</button>

      <div class="clickers">
        <%= for clicker <- @clickers do %>
          <div class="wrapped-clicker">
            <%= live_component(
              @socket,
              LiveviewExamplesWeb.ClickerComponent,
              id: clicker.id
            ) %>
            <button phx-click="remove-clicker" phx-value-clicker-id="<%= clicker.id %>" class="clicker-remove-button">Remove</button>
          </div>
        <% end %>
      </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, clickers: [])}
  end

  def handle_event("add-clicker", _, socket) do
    clickers = socket.assigns.clickers ++ [new_clicker()]
    {:noreply, assign(socket, clickers: clickers)}
  end

  def handle_event("remove-clicker", %{"clicker-id" => clicker_id}, socket) do
    clickers = remove_clicker(socket.assigns.clickers, clicker_id)
    {:noreply, assign(socket, clickers: clickers)}
  end

  defp new_clicker() do
    %{
      id: random_id()
    }
  end

  defp random_id() do
    20
    |> :crypto.strong_rand_bytes()
    |> Base.url_encode64(padding: false)
  end

  defp remove_clicker(clickers, remove_id) do
    Enum.filter(clickers, fn clicker -> clicker.id != remove_id end)
  end
end
