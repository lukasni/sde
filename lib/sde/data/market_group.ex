defmodule SDE.MarketGroup do
  def list_ids(), do: Map.keys(SDE.Data.get(:market_groups))
  def all(), do: SDE.Data.get(:market_groups)
  def info(id), do: Map.get(SDE.Data.get(:market_groups), id)
end
