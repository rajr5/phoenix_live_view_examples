defmodule LiveviewExamplesWeb.PageController do
  use LiveviewExamplesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
