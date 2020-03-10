defmodule LiveviewExamplesWeb.SingleClickerLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      <h2>LiveView Component - Clicker</h2>

      <%= live_component(
        @socket,
        LiveviewExamplesWeb.ClickerComponent,
        id: "clicker"
      ) %>
    """
  end
end
