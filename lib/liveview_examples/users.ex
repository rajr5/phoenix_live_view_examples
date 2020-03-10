defmodule LiveviewExamples.Users do

  # resolve this at compile time so we don't have to read and parse users continously
  @users Application.app_dir(:liveview_examples, "priv/users.json") |> File.read!() |> Jason.decode!()


  def search(nil) do
    data()
  end

  def search(query) do
    data()
    |> Enum.filter(fn user ->
      user_matches_query?(user, query)
    end)
  end

  def format_user(user) do
    "#{user["first_name"]} #{user["last_name"]} (#{user["email"]})"
  end

  defp user_matches_query?(user, query) do
    donwcased_query = String.downcase(query)

    "#{user["first_name"]} #{user["last_name"]}"
      |> String.downcase()
      |> String.contains?(donwcased_query)
    or
    user["email"]
      |> String.downcase()
      |> String.contains?(donwcased_query)
  end

  defp data() do
    @users
  end
end
