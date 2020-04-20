defmodule SDE.Region do
  @regions SDE.FSD.load_many!("/universe/**/region.staticdata") |> SDE.BSD.to_map("regionID")

  def list_ids(), do: Map.keys(@regions)
  def all(), do: @regions
  def info(region_id), do: Map.get(@regions, region_id)
end
