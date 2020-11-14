# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :easysubs,
  ecto_repos: [Easysubs.Repo]

# Configures the endpoint
config :easysubs, EasysubsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q97j6uy+orrjcKVbXgDmx8chZGIm2Yu5dz6zj07rVwf0YMy6wu5MqTTBA7qxC/jR",
  render_errors: [view: EasysubsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Easysubs.PubSub,
  live_view: [signing_salt: "dtWfVcx0"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
