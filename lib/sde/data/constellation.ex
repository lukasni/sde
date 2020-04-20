defmodule SDE.Constellation do
  @constellations SDE.FSD.load_many!("/universe/**/constellation.staticdata") |> SDE.BSD.to_map("constellationID")

  def list_ids(), do: Map.keys(@constellations)
  def all(), do: @constellations
  def info(constellation_id), do: Map.get(@constellations, constellation_id)
end
