defmodule SDE.Station do
  def list_ids(), do: Map.keys(SDE.Data.get(:stations))
  def all(), do: SDE.Data.get(:stations)
  def info(station_id), do: Map.get(SDE.Data.get(:stations), station_id)
end
