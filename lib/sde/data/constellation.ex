defmodule SDE.Constellation do
  def list_ids(), do: Map.keys(SDE.Data.get(:constellations))
  def all(), do: SDE.Data.get(:constellations)
  def info(constellation_id), do: Map.get(SDE.Data.get(:constellations), constellation_id)
end
