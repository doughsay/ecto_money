defmodule EctoMoney.Money do
  use Ecto.Schema

  schema "moneys" do
    field :amount, Money.Ecto.Composite.Type
  end
end
