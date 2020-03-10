defmodule LiveviewExamplesWeb.SearchLive do
  use Phoenix.LiveView

  alias LiveviewExamples.Users

  def render(assigns) do
    ~L"""
    <form phx-change="search" phx-submit="search">
      <%# autocomplete="new-pasword" disables chrome autofill for the input %>
      <input type="text" name="q" value="<%= @query %>" placeholder="Search..." autocomplete="new-password" autofill="off" />
    </form>

    <table>
        <thead>
          <th>ID</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Email</th>
        </thead>
        <tbody>
          <%= for user <- @users do %>
            <tr>
              <td><%= user["id"] %></td>
              <td><%= user["first_name"] %></td>
              <td><%= user["last_name"] %></td>
              <td><%= user["email"] %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
    """
  end

  def mount(_params, _session, socket) do
    users = Users.search(nil)
    {:ok, assign(socket, query: nil, users: users)}
  end

  def handle_event("search", %{"q" => query}, socket) when byte_size(query) <= 100 do
    users = Users.search(query)
    {:noreply, assign(socket, query: query, users: users)}
  end
end
