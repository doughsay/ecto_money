defmodule EctoMoney.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {EctoMoney.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: EctoMoney.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
