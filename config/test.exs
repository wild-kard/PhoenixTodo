import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :live_test, LiveTest.Repo,
  username: "postgres",
  password: "Staroceantail",
  hostname: "localhost",
  database: "live_test_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :live_test, LiveTestWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "DJ4c1JJTr+nkJIj1uPNXwHN2NY55/tOGUxm8fjnvMKSb3kNnyX7E6pPv6H8fi5Ki",
  server: false

# In test we don't send emails.
config :live_test, LiveTest.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
