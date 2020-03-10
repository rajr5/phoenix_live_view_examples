# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :liveview_examples, LiveviewExamplesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JfWLtMTZLpR6XQ9h2ZY/g1/Y7MLD+SIZB+7aQQ//E9gnYfaIYD0ppGTCSSqKQzum",
  render_errors: [view: LiveviewExamplesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveviewExamples.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "0jqxZMFa8UvhOrv8zIZso3uUXEQBEisI"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
