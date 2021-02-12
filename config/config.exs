import Config

config :ecto_money,
  ecto_repos: [EctoMoney.Repo]

config :ecto_money, EctoMoney.Repo,
  database: "ecto_money_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :ex_money, default_cldr_backend: EctoMoney.Cldr
