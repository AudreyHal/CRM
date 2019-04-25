use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :crm, CrmWeb.Endpoint,
  http: [port: 4001],
  server: true

config :hound, driver: "phantomjs"

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :crm, Crm.Repo,
  username: "postgres",
  password: "postgres",
  database: "crm_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
