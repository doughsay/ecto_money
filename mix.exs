defmodule EctoMoney.MixProject do
  use Mix.Project

  def project do
    [
      app: :ecto_money,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EctoMoney.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.5"},
      {:postgrex, ">= 0.0.0"},
      {:ex_money, "~> 5.5"},
      {:ex_money_sql, "~> 1.4"}
    ]
  end
end
