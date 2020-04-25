defmodule SDE.Contraband do
  def all(), do: SDE.Data.get(:contraband_types)

  def type(type_id), do: Map.get(SDE.Data.get(:contraband_types), type_id)

  def faction(faction_id) do
    SDE.Data.get(:contraband_types)
    |> Enum.filter(fn {_tid, %{factions: factions}} ->
      Map.has_key?(factions, faction_id)
    end)
    |> Enum.map(fn {tid, %{factions: factions}} -> {tid, factions[faction_id]} end)
    |> Map.new()
  end
end
