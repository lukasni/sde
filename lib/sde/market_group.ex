defmodule SDE.MarketGroup do
  @market_groups SDE.FSD.load!("marketGroups.yaml")

  def list_ids(), do: Map.keys(@market_groups)
  def all(), do: @market_groups
  def info(id), do: Map.get(@market_groups, id)
end
