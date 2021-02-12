# EctoMoney

Repo to demo a possible bug in `ex_money_sql` or `ecto`.

# Steps to reproduce

```elixir
# insert some moneys:

%EctoMoney.Money{amount: Money.new("100.00", :USD)} |> EctoMoney.Repo.insert()
%EctoMoney.Money{amount: Money.new("50.00", :USD)} |> EctoMoney.Repo.insert()
%EctoMoney.Money{amount: Money.new("75.00", :USD)} |> EctoMoney.Repo.insert()

# run a custom sum query and cast the response to a Money struct:

import Ecto.Query

query =
  from(
    money in "moneys",
    select: %{
      total: type(sum(money.amount), EctoMoneyType),
    }
  )

EctoMoney.Repo.all(query)
```

## Expected:

This is the response you get when using `ex_money_sql` == 1.3.1

```elixir
[%{total: #Money<:USD, 225.00>}]
```

## Actual:

Using `ex_money_sql` ~> 1.4, with the new parameterized type, we get a
compilation error:

    ** (UndefinedFunctionError) function Money.Ecto.Composite.Type.type/0 is undefined or private. Did you mean one of:

          * type/1

        (ex_money_sql 1.4.2) Money.Ecto.Composite.Type.type()
        (ecto 3.5.7) lib/ecto/type.ex:421: Ecto.Type.match?/2
        (ecto 3.5.7) lib/ecto/query/builder.ex:646: Ecto.Query.Builder.assert_type!/3
        (ecto 3.5.7) lib/ecto/query/builder.ex:415: Ecto.Query.Builder.escape/5
        (ecto 3.5.7) lib/ecto/query/builder.ex:462: Ecto.Query.Builder.escape_with_type/5
        (ecto 3.5.7) lib/ecto/query/builder/select.ex:111: anonymous fn/4 in Ecto.Query.Builder.Select.escape_pairs/4
        (elixir 1.11.3) lib/enum.ex:1533: Enum."-map_reduce/3-lists^mapfoldl/2-0-"/3
        (ecto 3.5.7) lib/ecto/query/builder/select.ex:82: Ecto.Query.Builder.Select.escape/4

# Workarounds

You can remove the casting, but then you get back a tuple instead of a Money
struct.

```elixir
query =
  from(
    money in "moneys",
    select: %{
      total: sum(money.amount),
    }
  )

EctoMoney.Repo.all(query)
```

Results in:

```elixir
[%{total: {"USD", #Decimal<225.00>}}]
```
