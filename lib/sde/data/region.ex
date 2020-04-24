defmodule SDE.Region do
  def list_ids(), do: Map.keys(SDE.Data.get(:regions))
  def all(), do: SDE.Data.get(:regions)
  def info(region_id), do: Map.get(SDE.Data.get(:regions), region_id)
end
