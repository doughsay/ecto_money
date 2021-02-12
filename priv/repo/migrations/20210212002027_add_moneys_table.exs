defmodule EctoMoney.Repo.Migrations.AddMoneysTable do
  use Ecto.Migration

  def change do
    create table(:moneys) do
      add :amount, :money_with_currency
    end
  end
end
