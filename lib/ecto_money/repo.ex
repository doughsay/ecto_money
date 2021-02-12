defmodule EctoMoney.Repo do
  use Ecto.Repo,
    otp_app: :ecto_money,
    adapter: Ecto.Adapters.Postgres
end
