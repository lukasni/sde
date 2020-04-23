defmodule SDE.Faction do
  def list_ids(), do: SDE.Data.get(:factions) |> Map.keys()
  def all(), do: SDE.Data.get(:factions)
  def info(faction_id), do: SDE.Data.get(:factions) |> Map.get(faction_id)
end
